class ChangeCauseTypes < ActiveRecord::Migration
  def up
    CauseType.find_by_slug('religion').try :delete
    CauseType.find_by_slug('hunger').try :delete
    CauseType.create_defaults
  end

end


