class Cause < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  extend FriendlyId
  friendly_id :name, use: :slugged


  # THESE API are WIP
  can_be_queried_by :cause_type_id, :type => :reference, :resource => "CauseType"
  can_be_queried_by :near, :type => :string, :allowed => ['Chicago','New York','San Fancisco']

  attr_accessor :skip_default_location
  attr_accessible :contact_email,:short_description, :city_slug, :display_name,:cause_types, :cause_type_ids, :city, :state, :picture, :is_featured, :description, :twitter_handle, :video_link, :name, :mission_statement, :how_hear, :phone_number, :email, :website, :facebook_url, :skip_default_location

  has_attached_file  :picture, :styles => { :medium => "300x300>", :thumb => "100x100>", :cause_tile => "81x81#" }, :default_url => "/assets/missing.jpeg"

  belongs_to :cause_type

  has_and_belongs_to_many :cause_types, :join_table => 'causes_cause_types'

  has_many :needs,     :dependent => :delete_all
  has_many :locations, :dependent => :delete_all
  has_many :campaigns, :dependent => :delete_all
  has_many :followers, :dependent => :delete_all

  has_many :cash_donations
  has_many :goods_donations
  has_many :volunteers
  has_many :cause_images

  validates :name, :uniqueness => true

  after_create :create_default_records

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

  def create_default_location
    if locations.count == 0 and !skip_default_location
      locations.create location_attributes.merge(name:"Main Office")
    end
  end

  def location_attributes
    loc = {}

    # this is temporary
    loc.merge! :address_line_one => self.address_line_one || Unite::Development.random_address_in(:chicago),
               :address_line_two =>self.address_line_two || '',
                       :postal_code => self.postal_code || "60610",
                       :country => self.country || "US",
                       :region => self.region || "IL",
                       :city => self.city || "Chicago"

    # any
    loc[:city]    = "Chicago" if self.city.length == 0
    loc[:region]  = "IL" if self.region.length == 0

    loc
  end

  def address
    location_hash= location_attributes
    "#{name}, #{location_hash[:address_line_one]} #{location_hash[:address_line_two]}, #{location_hash[:city]}, #{location_hash[:state]}, #{location_hash[:postal_code]}"
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

  def cause_tile_picture_url
    url = picture.url(:medium)

    if url.match(/missing/)
      url = "/assets/missing-square.jpg"
    end

    url
  end

  def location
    location = "#{city}, #{region}"
    location
  end

  def short_description
    read_attribute(:short_description) || "Enter short cause description"
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

  def self.featured_causes
    featured_causes={}
    CauseType.all.each do |cause_type|
      featured_cause = Cause.by_cause_type(cause_type.slug).where('is_featured',true).order("RANDOM()").first
      if featured_cause
        featured_causes[cause_type.name]= featured_cause
      end
    end
    featured_causes
  end

  def self.featured count=4
    cause_ids = FeaturedCause.cause_ids
    where(id: cause_ids ).limit(4)
  end


  QueryableScopes = %w{by_type_of_need by_cause_type by_city_slug}

  scope :by_type_of_need, lambda {|type_of_need| joins(:needs).where("needs.type_of_need = ?", type_of_need) }
  scope :by_cause_type, lambda {|cause_type_slug| joins(:cause_type).where("cause_types.slug = ?", cause_type_slug) }
  scope :by_city_slug, lambda {|city_slug| where(:city_slug => city_slug) }

  def self.query(params={})
    results = scoped
    results = results.includes(:locations,:campaigns,:needs)

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
      results = results.where(cause_type_id: params[:cause_type_id])
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
#

