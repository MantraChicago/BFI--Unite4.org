class AddCaptionToCauseImages < ActiveRecord::Migration
  def change
    add_column :cause_images, :caption, :text
  end
end
