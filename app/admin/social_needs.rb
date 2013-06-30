ActiveAdmin.register SocialNeed do
	form :html => { :enctype => "multipart/form-data" } do |f|
	   f.inputs "Details" do
	    
	    f.input :name
	    f.input :description
	    f.input :cause
	    
	  end
	  f.buttons
	 end  
end
