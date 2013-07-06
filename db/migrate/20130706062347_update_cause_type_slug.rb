class UpdateCauseTypeSlug < ActiveRecord::Migration
  def up
    CauseType.all.each &:save!
  end
end
