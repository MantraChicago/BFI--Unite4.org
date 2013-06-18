class CreateFeaturedCauses < ActiveRecord::Migration
  def change
    create_table :featured_causes do |t|

      t.timestamps
    end
  end
end
