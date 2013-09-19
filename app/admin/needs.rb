ActiveAdmin.register Need do
form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do

      f.input :name
      f.input :is_active

      f.input :cause

      f.input :description
      
      f.input :end_date
      f.input :current_state

      

      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:medium))

    end
    f.buttons
   end  
end
