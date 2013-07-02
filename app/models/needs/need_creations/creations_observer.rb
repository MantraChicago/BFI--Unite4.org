class CreationsObserver < ActiveRecord::Observer
  observe :donation,:volunteer
  
  def after_create(record)
    amount_to_add= record.amount_added_to_campaign_goal ||=1
    self.increase_campaign record.id, amount_to_add

  end

  def self.increase_campaign(need_id,add_amount=1)
    campaign=Campaign.find_by_need_id need_id
    if campaign
      new_campaign_state=campaign.current_state.to_f+add_amount
      campaign.current_state = new_campaign_state
      campaign.save
    end
  end

end