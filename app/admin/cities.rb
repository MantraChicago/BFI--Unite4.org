ActiveAdmin.register City do
  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do

      f.input :name
      f.input :slug
      f.input :state
      f.input :latitude
      f.input :longitude
      f.input :is_active
      

      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:thumb))

    end
    f.buttons
   end  
end
