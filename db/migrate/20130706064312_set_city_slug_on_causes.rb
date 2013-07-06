class SetCitySlugOnCauses < ActiveRecord::Migration
  def up
    remove_column :causes, :city_id

    CauseType.all.each(&:save)
    Cause.update_all :city_slug => "chicago"
  end

  def down
  end
end
