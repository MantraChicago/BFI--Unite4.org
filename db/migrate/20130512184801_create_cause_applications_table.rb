class CreateCauseApplicationsTable < ActiveRecord::Migration
  def change
  	create_table "cause_applications" do |t|
	    t.string   "name"
	    t.string   "org_name"
	    t.string   "website"
	    t.string   "email"
	    t.string   "phone_number"
	    t.text     "mission"
	    t.text     "how_hear"
	  end
  end
end
