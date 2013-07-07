class TypeOfNeedMigration < ActiveRecord::Migration
  def up
    translate = {
      "SocialNeed" => "followers",
      "VolunteerNeed" => "volunteers",
      "DonationsNeed" => "cash_donations"
    }

    Need.all.each do |need|
      if translation = translate[need.type_of_need]
        need.type_of_need = translation
        need.save!
      end
    end

    Campaign.all.each do |campaign|
      unless campaign.type_of_need.present?
        campaign.type_of_need = campaign.need.type_of_need
        campaign.save!
      end
    end
  end

  def down
  end
end
