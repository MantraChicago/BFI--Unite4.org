class RunLocationFixingOneTime < ActiveRecord::Migration
  def up
    Cause.all.each(&:create_default_location)
  end

  def down
  end
end
