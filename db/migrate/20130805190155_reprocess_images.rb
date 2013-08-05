class ReprocessImages < ActiveRecord::Migration
  def up
    CauseType.all.each do |cause_type|
      cause_type.picture.reprocess!
    end

    CauseImage.all.each do |cause_image|
      cause_image.picture.reprocess!
    end
  end

end
