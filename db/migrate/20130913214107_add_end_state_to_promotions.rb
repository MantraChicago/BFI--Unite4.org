class AddEndStateToPromotions < ActiveRecord::Migration
  def up
    PromotionNeed.all.each do |p_need|
      if ! p_need.desired_state
        p_need.desired_state = 100
        p_need.save
      end

      if ! p_need.name
        p_need.name = 'Help promote our cause'
        p_need.save
      end
      p_need.description = 'Help us get the word out. The more people that know, the more that can help.'
      p_need.save

    end
  end
end
