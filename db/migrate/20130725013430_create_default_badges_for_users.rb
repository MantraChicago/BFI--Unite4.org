class CreateDefaultBadgesForUsers < ActiveRecord::Migration
  def up
    Badge.create_defaults(true)
    User.all.each(&:award_default_badge)
  end

  def down
  end
end
