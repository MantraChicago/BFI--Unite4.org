ActiveAdmin.register Cause do
	form :html => { :enctype => "multipart/form-data" } do |f|
	   f.inputs "Details" do
	    
	    f.input :name
	    f.input :description
	    f.input :mission_statement
	    f.input :how_hear
	    f.input :phone_number
	    f.input :email
	    f.input :website
	    f.input :city
	    f.input :state
	    f.input :video_link
	    f.input :twitter_handle
	    f.input :facebook_url
	    
	    f.inputs "Cause types" do # Make a panel that holds inputs for lifestyles
	      f.input :cause_types, as: :check_boxes, collection: CauseType.all 
	    end
	    f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:medium))
	    
	  end
	  f.buttons
	 end  
end
