class Cause < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :cause_type_ids, :city, :state, :picture, :is_featured, :description, :twitter_handle, :video_link, :name, :mission_statement, :how_hear, :phone_number, :email, :website, :facebook_url
  has_attached_file  :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing.jpeg"

  has_and_belongs_to_many :cause_types, :join_table => 'causes_cause_types'

  has_many :needs, :dependent => :destroy_all
  has_many :locations, :dependent => :destroy_all

  has_many :campaigns, :dependent => :destroy_all

  validates :name, :uniqueness => true
  #has_one :campaign

  def location
    [city,state].compact.join(", ")
  end

  def active_campaign
    campaigns.active.limit(1)
  end

  def self.query(params={})
    results = scoped
    results = results.includes(:locations, :needs, :campaigns)

    if params[:cause_type_id]
      results = results.joins(:cause_type)
    end

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
#

