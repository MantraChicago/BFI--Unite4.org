class RemoveFollowerNeeds < ActiveRecord::Migration
  def up
    Contribution.where(:need_type => 'FollowerNeed').delete_all
    Need.where(:type => "FollowerNeed").delete_all
  end
end
