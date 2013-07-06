class CauseType < ActiveRecord::Base
  attr_accessible :name, :picture_url
  has_and_belongs_to_many :causes, :join_table => 'causes_cause_types'

  attr_accessible :picture

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing_cause_type.jpg"

  #def self.cause_ids_for_cause_type cause_type_id
  #  connection.execute "SELECT distinct cause_id FROM causes_cause_types WHERE id = '#{ cause_type_id.to_i }'"
  #  binding.pry
  #end

  def picture_url
    picture.try(:url)
  end

  def self.random(count=1)
    order("random()").limit(1).first
  end
end
