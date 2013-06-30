class Badge < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :name, :description, :file_name, :accomplishment
  has_and_belongs_to_many :users, :join_table=>:badges_users

  def self.query(params={})
    results = scoped
    results = results.where(user_id: params[:user_id]) if params[:user_id]

    results
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

