class AddActiveStateToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :is_active, :boolean
    active_badge_slugs=['chatty_cathy','checking_it_out','doler_of_dollars','enthusiast','getting_out_there','goodie_goodie','keeping_tabs','megaphone','sign_up']
    Badge.all.each do |badge|
      badge.is_active=true if active_badge_slugs.include? badge.slug
      badge.save
    end
  end
end
