class CauseApplication < ActiveRecord::Base
  attr_accessible :name, :org_name, :website, :email, :phone_number, :mission, :how_hear, :facebook, :twitter, :mailing_address

  validates :name, :org_name, :website, :phone_number, :mission,   :presence => true
  validates :email, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

end

# == Schema Information
#
# Table name: cause_applications
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  org_name     :string(255)
#  website      :string(255)
#  email        :string(255)
#  phone_number :string(255)
#  mission      :text
#  how_hear     :text
#

