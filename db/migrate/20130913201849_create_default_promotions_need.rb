class CreateDefaultPromotionsNeed < ActiveRecord::Migration
  def up
    Cause.all.each do |cause|
      if ! cause.active_campaign
        promotion_need=PromotionNeed.create({
                                cause_id: cause.id,
                                is_primary: true,
                                is_active: true,
                                end_date: Time.zone.now + 1.month,
                                message: "Help promote #{cause.name}"})
      end

    end
  end
end
