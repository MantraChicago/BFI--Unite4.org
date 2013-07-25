class Badge < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :name, :description, :file_name, :accomplishment
  has_and_belongs_to_many :users, :join_table=>:users_badges

  validates_presence_of :name, :accomplishment
  validates_uniqueness_of :accomplishment, :name

  before_save :set_defaults

  can_be_queried_by :user_id

  has_attached_file  :image, :styles => { :medium => "300x300>", :thumb => "150x150>", :cause_tile => "81x81#" }, :default_url => "/assets/badges/new_user.png"

  def set_defaults
    self.file_name ||= "#{ self.name.parameterize }.png"
  end

  def self.query(params={})
    results = scoped
    results = results.where(user_id: params[:user_id]) if params[:user_id]

    results
  end

  DefaultBadges = [
    {name: 'Signed Up', accomplishment: "user_signed_up"},
    {name: 'Complete Profile', accomplishment: "completed_profile"},
    {name: 'Watch Video', accomplishment: "watched_video"},
    {name: 'Share with friends', accomplishment: "shared_with_friends"}
  ]

  def self.create_defaults should_delete=false
    delete_all if should_delete

    DefaultBadges.each do |badge_attributes|
      Badge.create(badge_attributes)
    end
  end
end

# == Schema Information
#
# Table name: badges
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  file_name      :string(255)
#  accomplishment :string(255)
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

