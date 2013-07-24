ActiveAdmin.register CauseImage do
  form :html => { :enctype => "multipart/form-data" } do |f|
     f.inputs "Details" do
      
      f.input :cause, collection: Cause.all
      f.input :caption
      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:medium))
      
    end
    f.buttons
   end 
end