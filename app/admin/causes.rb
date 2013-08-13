ActiveAdmin.register Cause do
	scope_to do
    Class.new do
      def self.causes
        Cause.unscoped
      end
    end
  end

	form :html => { :enctype => "multipart/form-data" } do |f|
	   f.inputs "Details" do

	    f.input :name
	    f.input :display_name
      f.input :short_description
	    f.input :description
	    f.input :mission_statement
	    f.input :how_hear
	    f.input :phone_number
	    f.input :email
	    f.input :website
	    f.input :cities, as: :check_boxes, collection: City.all
	    f.input :state
	    f.input :video_link
	    f.input :twitter_handle
	    f.input :facebook_url
	    f.input :is_featured
	    f.input :user
	    f.input :active


	    f.input :cause_types, as: :check_boxes, collection: CauseType.all
	    f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:medium))

	  end
	  f.buttons
	 end
end
