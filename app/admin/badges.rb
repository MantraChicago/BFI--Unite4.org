ActiveAdmin.register Badge do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.input :name
    f.input :description
    f.input :image, :as => :file
  end
end
