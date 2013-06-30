class Cause < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  # THESE API are WIP
  can_be_queried_by :cause_type_id, :type => :reference, :resource => "CauseType"
  can_be_queried_by :city, :type => :string, :allowed => ['Chicago','New York','San Fancisco']

  attr_accessible :display_name,:cause_types, :cause_type_ids, :city, :state, :picture, :is_featured, :description, :twitter_handle, :video_link, :name, :mission_statement, :how_hear, :phone_number, :email, :website, :facebook_url
  has_attached_file  :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"

  belongs_to :cause_type

  has_and_belongs_to_many :cause_types, :join_table => 'causes_cause_types'

  has_many :needs, :dependent => :delete_all
  has_many :locations, :dependent => :delete_all
  has_many :campaigns, :dependent => :delete_all

  has_many :usercauses
  has_many :users, :through => :usercauses

  validates :name, :uniqueness => true

  after_create :create_default_records

  def create_default_location
    existing = locations.where(name:'Main Office')

    if existing.count == 0
      location_attributes = attributes.slice(:address_line_one,:address_line_two,:city,:region,:postal_code,:country)
      locations.create location_attributes.merge(name:"Main Office")
    end
  end

  def create_default_records
    create_default_location
    create_default_campaign(create_default_need)
  end

  # every cause by default has a social need ( for followers )
  def create_default_need
    SocialNeed.create(cause_id: self.id) if needs.count == 0
  end

  def create_default_campaign need=nil
    campaigns.create(need_id: need.id, active: true, start_date: Time.now, end_date: 30.days.from_now)  if campaigns.count == 0
  end

  def active_campaign
    campaigns.active.limit(1).first
  end

  def picture_url style=:medium
    picture.url(style)
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
#  state                :string(255)
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
#

