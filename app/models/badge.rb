class Badge < ActiveRecord::Base
  include Smooth::Queryable
  include Smooth::Presentable

  attr_accessible :name, :description, :file_name, :accomplishment
  has_and_belongs_to_many :users, :join_table=>:badges_users

  can_be_queried_by :user_id

  def self.query(params={})
    results = scoped
    results = results.where(user_id: params[:user_id]) if params[:user_id]

    results
  end
end
