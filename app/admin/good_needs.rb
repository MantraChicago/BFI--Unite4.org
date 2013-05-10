ActiveAdmin.register GoodNeed do
	form :html => { :enctype => "multipart/form-data" } do |f|
	   f.inputs "Details" do
	    
	    f.input :name
	    f.input :description
	    f.input :cause_id
	    f.input :address
	    
	    f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:medium))
	    
	  end
	  f.buttons
	 end
end


