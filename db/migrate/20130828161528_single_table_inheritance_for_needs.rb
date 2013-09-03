class SingleTableInheritanceForNeeds < ActiveRecord::Migration
  def up
    
    add_column :needs, :type, :string

    Need.all.each do |need|
      need.type= need.type_of_need.singularize.classify+'Need'
      need.save
    end
  end

  def down
    remove_column :needs, :type
  end  
end
