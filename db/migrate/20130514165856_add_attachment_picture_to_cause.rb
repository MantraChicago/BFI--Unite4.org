class AddAttachmentPictureToCause < ActiveRecord::Migration
  def self.up
    add_column :causes, :picture_file_name, :string
    add_column :causes, :picture_content_type, :string
    add_column :causes, :picture_file_size, :integer
    add_column :causes, :picture_updated_at, :datetime
  end

  def self.down
    remove_column :causes, :picture_file_name
    remove_column :causes, :picture_content_type
    remove_column :causes, :picture_file_size
    remove_column :causes, :picture_updated_at
  end
end
