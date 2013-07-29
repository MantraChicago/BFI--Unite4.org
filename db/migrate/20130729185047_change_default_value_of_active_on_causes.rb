class ChangeDefaultValueOfActiveOnCauses < ActiveRecord::Migration
  def up
    Cause.all.each do |cause|
      cause.active=true
      cause.save
    end

    change_column :causes, :active, :boolean, :default => true

  end
end
