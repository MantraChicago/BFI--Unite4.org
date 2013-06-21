ActiveAdmin.register GoodNeed do
	form :html => { :enctype => "multipart/form-data" } do |f|
	   f.inputs "Details" do
	   	f.input :cause, :as => :select, :collection => Cause.all, :include_blank => false
	    f.input :name
	    f.input :description
	    
	    f.input :address

	    
	    f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:medium))
	    
	  end
	  f.buttons
	 end
end


