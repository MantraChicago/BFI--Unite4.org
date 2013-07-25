require "open-uri"

class User < ActiveRecord::Base
  include Smooth::Presentable
  #validates :first_name, :last_name, :presence => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :fb_token,:provider, :uid ,:level, :city, :state, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at, :avatar_updated_at,  :avatar_file_size,:avatar_file_name,:avatar_content_type, :bio,:provider, :uid,:cause_ids, :usercause_ids,:avatar,:email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :encrypted_password, :remember_created_at, :current_sign_in_at, :last_sign_in_at, :last_sign_in_ip, :reset_password_token, :reset_password_sent_at, :current_sign_in_ip, :reset_password_sent_at, :current_sign_in_at, :last_sign_in_at, :img_name, :current_sign_in_at, :last_sign_in_at

  has_many :followers
  has_many :causes, :through => :followers

  has_many :contributions

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/assets/missing.jpeg"

  has_and_belongs_to_many :badges, :join_table=>:users_badges

  after_create :identify_customer_with_customer_io

  after_create :reset_authentication_token!

  after_create :award_default_badge


  after_destroy do
    $customerio.delete(self.customer_io_id)
  end

  alias_method :avatar_old, :avatar

  def self.random limit=1
    order("random()").limit(1)
  end

  def self.random_user
    random(1).first
  end

  def award_badge name, options={}
    badge = Badge.find_by_name(name)
    self.badges << badge if badge
    self.save
  end

  def award_default_badge
    award_badge('Sign Up')
  end

  def customer_io_id
    "#{ Rails.env }-#{ self.id }"
  end

  def identify_customer_with_customer_io
    begin
      $customerio_user.identify(
        :id => customer_io_id,
        :email => self.email,
        :created_at => self.created_at.to_i,
        :first_name => self.first_name
      )

      $customerio.track(customer_io_id, "New user")
    rescue
      #what should we do?
    end
  end

  def followed_causes_locations
    causes_array=[]
    causes.each do |cause| #because I can't igure out the join
      cause_hash=cause.as_json
      cause_hash[:locations_details]=cause.locations
      causes_array << cause_hash
    end
    causes_array
  end

  def display_name
    name=''
    if first_name
      name +=first_name
    end
    if last_name
      name +=' '+last_name
    end

    name
  end

  def is_following_cause(cause)
    causes.all.include? cause
  end

  def location
    location = ""

    if city && !city.empty? && state && !state.empty?
      location = "#{city}, #{state}"
    end

    if city && !city.empty?
      location = city
    end

    if state && !state.empty?
      location = state
    end
    location
  end

  def unfollow cause
    followers.where(cause_id: cause.id).delete_all
  end

  def followed_causes_ids
    followers.select("distinct cause_id").map(&:cause_id)
  end

  class DummyPaperclip < String
    def url(size=nil)
      if size == :thumb
        self + "?width=100&height=100"
      elsif size == :medium
        self + "?width=300&height=300"
      else
        self + "?type=large"
      end
    end
  end
  def avatar
    if self.avatar_file_name.nil? && self.uid
      DummyPaperclip.new("https://graph.facebook.com/#{self.uid}/picture")
    else
      avatar_old
    end
  end

  def self.find_or_create_from_facebook(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    # try finding by email
    user = User.find_by_email(auth.info.email) if user.nil?
    locationArray=auth.try(:info).try(:location).try(:split, ',')
    if user
      user.update_attributes({
        :first_name => auth.info.first_name,
        :last_name => auth.info.last_name,
        :city => locationArray.try(:[], 0) || '',
        :state => locationArray.try(:[], 1) || '',
        :fb_token => auth.credentials.token
      })
      # Update attributes should save
      # user.save
    else
      user = User.create(
        provider: auth.provider,
        uid:  auth.uid,
        email: auth.info.email,
        password: Devise.friendly_token[0,20],
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        city: locationArray.try(:[], 0) || '',
        state: locationArray.try(:[], 1) || '',
        fb_token: auth.credentials.token
      )
    end
    user
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  bio                    :text
#  city                   :string(255)
#  state                  :string(255)
#  level                  :integer          default(0)
#  provider               :string(255)
#  uid                    :string(255)
#  game_id                :integer
#  fb_token               :text
#  role                   :string(255)
#  followers_count        :integer          default(0)
#  cash_donations_count   :integer          default(0)
#  goods_donations_count  :integer          default(0)
#  volunteers_count       :integer          default(0)
#  authentication_token   :string(255)
#  cause_admin            :boolean
#  cause_admin_id         :integer
#

