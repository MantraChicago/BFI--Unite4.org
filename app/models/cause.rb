class Cause < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  extend FriendlyId
  friendly_id :name, use: :slugged

  # THESE API are WIP
  can_be_queried_by :cause_type_id, :type => :reference, :resource => "CauseType"
  can_be_queried_by :near, :type => :string, :allowed => ['Chicago','New York','San Fancisco']

  attr_accessor :skip_default_location
  attr_accessible :active,:user_id,:contact_email,:short_description, :city_slug,:cause_types, :cause_type_ids, :city, :state, :picture, :is_featured, :description, :twitter_handle, :video_link, :name, :mission_statement, :how_hear, :phone_number, :email, :website, :facebook_url, :skip_default_location
  attr_accessible :contact_email, :contact_name, :contact_phone_number, :contact_address
  attr_accessible :contact_address, :zip_code, :bank_account, :bank_routing, :address, :cities, :city_ids

  has_attached_file  :picture, :styles => { :medium => "300x300>", :thumb => "100x100>", :cause_tile => "81x81#" }, :default_url => "/assets/missing-square.jpg"

  belongs_to :cause_type

  has_and_belongs_to_many :cause_types, :join_table => 'causes_cause_types'
  has_and_belongs_to_many :cities, :uniq => true

  has_many :needs,     :dependent => :delete_all
  has_many :locations, :dependent => :delete_all
  has_many :followers, :dependent => :delete_all
  has_many :contributions, :dependent => :delete_all

  has_many :cash_donations
  has_many :goods_donations
  has_many :volunteers
  has_many :cause_images
  has_many :promotions

  belongs_to :user
  validate :twitter_must_not_be_url 

  validates :name, :uniqueness => true

  delegate :need_id, :type_of_need, :days_to_go, :desired_state, :current_state, :goal_unit, :percent_complete, :goal_summary, :to => :active_campaign, :allow_nil => true, :prefix => true

  def urls
    {
      :follow_url => "/causes/#{ slug }/followers",
      :profile_url => "/causes/#{ slug }"
    }
  end

  def following_users
    User.where(id: followers.map(&:user_id))
  end

  def address
    ret_address= name
    ret_address += "#{contact_address}," if ! contact_address.blank?
    ret_address += " #{city}," if ! city.blank?
    ret_address += " #{state}," if ! state.blank?
    ret_address += " #{postal_code}," if ! postal_code.blank?
    ret_address.chop!
    ret_address
  end

  def display_name
    name
  end


  def total_cash_donations
    contributions.by_fullfilment_type('CashDonation').all.inject(0) {|total,contribution| total+contribution.fulfillment.amount }
  end

  def grouped_by_cause_type_and_city(cause_type_slug,city_slug)
    Cause.by_city_slug(city_slug).by_cause_type(cause_type_slug).group(:city_slug).count
  end
  

  # TEMP
  # Until the presenter nesting works better in smooth
  def locations_details
    locations.map {|l| l.present_as(:default) }
  end

  def active_campaign
    needs.where(:is_primary => true, :is_active=>true).first
    #.where('end_date > ?' , Time.zone.now)
  end

  def location
    location = [city," #{region}"].join(',')
    location
  end

  def short_description
    read_attribute(:short_description) || "Enter short cause description"
  end

  def picture_url style=:medium
    picture.url(style)
  end

  def facebook_link
    facebook_url if !facebook_url.try(:empty?)
  end

  def twitter_link
    "https://twitter.com/#{twitter_handle}" if ! twitter_handle.empty?
  end

  def twitter_must_not_be_url
    match = twitter_handle =~ /^[A-Za-z0-9_]{1,15}$/
    errors.add(:twitter_handle, "The Twitter handle must be a Twitter handle") if !(match && match >=0) && !twitter_handle.empty?
  end
  
  def self.featured_causes city_slug
    featured_causes={}
    CauseType.all.each do |cause_type|
      featured_cause = Cause.by_city_slug(city_slug).by_cause_type(cause_type.slug).where('is_featured',true).order("RANDOM()").first
      if featured_cause
        featured_causes[cause_type.name]= featured_cause
      end
    end
    featured_causes
  end
=begin
  def self.featured count=4
    cause_ids = FeaturedCause.cause_ids
    where(id: cause_ids ).limit(4)
  end
=end

  QueryableScopes = %w{by_type_of_need by_cause_type by_city_slug}

  default_scope where( :active => true )

  scope :all_causes, lambda{}
  scope :featured,lambda { where(:is_featured => true) } 
  scope :by_type_of_need, lambda {|type_of_need| joins(:needs).where("needs.type_of_need = ?", type_of_need) }
  scope :by_cause_type, lambda {|cause_type_slug| 
                          cause_type_id=CauseType.find_by_slug(cause_type_slug).id
                          joins(:cause_types).where("causes_cause_types.cause_type_id = ?", cause_type_id) 
                        }
  scope :by_city_slug, lambda {|city_slug| 
                          city_id= City.find_by_slug(city_slug).id
                          joins(:cities).where('causes_cities.city_id = ?', city_id) 
                        }

  def self.query(params={})
    results = scoped
    results = results.includes(:locations,:needs)

    if params[:scope].is_a?(Array)
      base, value = params[:scope]

      if QueryableScopes.include?(base.to_s)
        results = results.send(base.to_s,value)
      end
    end

    if params[:scope].is_a?(String) and QueryableScopes.include?(params[:scope])
      results = results.send(params[:scope])
    end

    QueryableScopes.each {|base| results = results.send(base, params[base]) if params[base] }

    join_ids = []

    if params[:near]
      join_ids += Location.near(params[:near]).flatten.collect(&:cause_id)
    end

    results = results.where(id: join_ids) unless join_ids.empty?

    if params[:has_need]
      results = results.where("needs.type_of_need = ?", params[:has_need])
    end

    if params[:cause_type_id]
      results = CauseType.find(params[:cause_type_id]).causes
    end

    results = results.reorder("causes.name asc")
    results
  end

end

# == Schema Information
#
# Table name: causes
#
#  id                    :integer          not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  name                  :string(255)
#  description           :text
#  mission_statement     :text
#  how_hear              :text
#  phone_number          :string(255)
#  email                 :string(255)
#  website               :string(255)
#  cause_type_id         :integer
#  city                  :string(255)
#  region                :string(255)
#  video_link            :string(255)
#  picture_file_name     :string(255)
#  picture_content_type  :string(255)
#  picture_file_size     :integer
#  picture_updated_at    :datetime
#  is_featured           :boolean          default(FALSE)
#  twitter_handle        :string(255)
#  facebook_url          :string(255)
#  active                :boolean
#  display_name          :string(255)
#  address_line_one      :string(255)
#  address_line_two      :string(255)
#  postal_code           :string(255)
#  country               :string(255)
#  locations_count       :integer          default(0)
#  needs_count           :integer          default(0)
#  donations_count       :integer          default(0)
#  volunteers_count      :integer          default(0)
#  followers_count       :integer          default(0)
#  slug                  :string(255)
#  cash_donations_count  :integer          default(0)
#  goods_donations_count :integer          default(0)
#  city_slug             :string(255)
#  short_description     :string(255)
#  contact_email         :string(255)
#  user_id               :integer
#

