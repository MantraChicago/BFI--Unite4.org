class Volunteer < ActiveRecord::Base
  attr_accessible :need_id, :location_id, :cause_id, :user_id

  belongs_to :need
  belongs_to :location
  belongs_to :cause, :counter_cache => true
  belongs_to :user, :counter_cache => true

   def related_campaign
    cause.campaigns.where(:need_id => self.need_id).first
  end

  def update_campaign
    return unless related_campaign.present?

    # do whatever here
  end 
end

# == Schema Information
#
# Table name: volunteers
#
#  id             :integer          not null, primary key
#  cause_id       :integer
#  user_id        :integer
#  need_id        :integer
#  location_id    :integer
#  description    :string(255)
#  user_showed_up :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

