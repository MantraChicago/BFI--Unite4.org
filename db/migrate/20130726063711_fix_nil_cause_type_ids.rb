class FixNilCauseTypeIds < ActiveRecord::Migration
  def up
    Cause.all.each &:save
  end

  def down
  end
end
