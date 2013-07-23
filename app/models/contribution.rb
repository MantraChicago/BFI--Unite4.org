class Contribution < ActiveRecord::Base
  attr_accessible :need_id, :need_type, :fulfilment_type, :fulfilment_id, :user_id, :cause_id

  belongs_to :user
  belongs_to :cause

  def fullfilment
    fulfilment_model.find(need_id)
  end

  def need
    if need_id
      need_model.find(need_id)
    end
  end

  def fulfilment_model
    fulfilment_type.camelize.constantize
  end

  def need_model
    need_type.camelize.singularize.constantize
  end
end
