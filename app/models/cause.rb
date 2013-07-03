class Cause < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  extend FriendlyId
  friendly_id :name, use: :slugged


  # THESE API are WIP
  can_be_queried_by :cause_type_id, :type => :reference, :resource => "CauseType"
  can_be_queried_by :near, :type => :string, :allowed => ['Chicago','New York','San Fancisco']

  attr_accessor :skip_default_location
  attr_accessible :display_name,:cause_types, :cause_type_ids, :city, :state, :picture, :is_featured, :description, :twitter_handle, :video_link, :name, :mission_statement, :how_hear, :phone_number, :email, :website, :facebook_url, :skip_default_location

  has_attached_file  :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"

  belongs_to :cause_type

  has_and_belongs_to_many :cause_types, :join_table => 'causes_cause_types'

  has_many :needs, :dependent => :delete_all
  has_many :locations, :dependent => :delete_all
  has_many :campaigns, :dependent => :delete_all

  has_many :followers, :dependent => :delete_all
  has_many :cash_donations
  has_many :goods_donations
  has_many :volunteers

  has_many :users, :through => :followers

  validates :name, :uniqueness => true

  after_create :create_default_records

  def create_default_location
    if locations.count == 0 and !skip_default_location
      locations.create location_attributes.merge(name:"Main Office")
    end
  end

  def location_attributes
    loc = {}

    # this is temporary
    loc.merge! :address_line_one => self.address_line_one || Unite::Development.random_address_in(:chicago),
                       :postal_code => self.postal_code || "60610",
                       :country => self.country || "US",
                       :region => self.region || "IL",
                       :city => self.city || "Chicago"

    loc[:city] = "Chicago" if self.city.length == 0
    loc[:region] = "IL" if self.region.length == 0

    loc
  end

  def create_default_records
    create_default_location
    create_default_campaign(create_default_need)
  end

  # every cause by default has a social need ( for followers )
  def create_default_need
    if needs.count == 0
      needs.create(type_of_need:"followers")
    else
      needs.first
    end
  end

  # TEMP
  # Until the presenter nesting works better in smooth
  def locations_details
    locations.map {|l| l.present_as(:default) }
  end

  # TEMP
  # Until the presenter nesting works better in smooth
  def campaign_details
    active_campaign && active_campaign.present_as(:cause_profile)
  end

  def create_default_campaign need=nil
    campaigns.create(need_id: need.id, active: true, start_date: Time.now, end_date: 30.days.from_now)  if campaigns.count == 0
    campaigns.update_all(active:true)
    self
  end

  def active_campaign
    campaigns.active.limit(1).first
  end

  def picture_url style=:medium
    picture.url(style)
  end

  def state= value
    self.region = value
  end

  def state
    region
  end

  def zip= value
    self.postal_code = value
  end

  def zip
    postal_code
  end


  def self.query(params={})
    results = scoped
    results = results.includes(:locations, :needs, :campaigns)

    join_ids = []

    # NOTE:
    #
    # For this iteration we will only support one cause type per cause.  I want to move over
    # to acts_as_taggable for this because has and belongs to many relationships require way too many
    # acrobatics to do querying naturally and cleanly
    #
    #
    #    if params[:cause_type_id]
    #      Array(params[:cause_type_id]).each do |cause_type_id|
    #        join_ids += CauseType.cause_ids_for_cause_type(cause_type_id)
    #      end
    #    end

    if params[:near]
      join_ids += Location.near(params[:near]).flatten.collect(&:cause_id)
    end

    results = results.where(id: join_ids) unless join_ids.empty?

    results = results.where(cause_type_id: params[:cause_type_id]) if params[:cause_type_id]

    results
  end
end

# == Schema Information
#
# Table name: causes
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  name                 :string(255)
#  description          :text
#  mission_statement    :text
#  how_hear             :text
#  phone_number         :string(255)
#  email                :string(255)
#  website              :string(255)
#  cause_type_id        :integer
#  city                 :string(255)
#  region               :string(255)
#  video_link           :string(255)
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  is_featured          :boolean          default(FALSE)
#  twitter_handle       :string(255)
#  facebook_url         :string(255)
#  city_id              :integer
#  active               :boolean
#  display_name         :string(255)
#  address_line_one     :string(255)
#  address_line_two     :string(255)
#  postal_code          :string(255)
#  country              :string(255)
#  locations_count      :integer          default(0)
#  needs_count          :integer          default(0)
#  donations_count      :integer          default(0)
#  volunteers_count     :integer          default(0)
#  followers_count      :integer          default(0)
#  slug                 :string(255)
#

