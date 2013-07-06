class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :badges, :id, :unique => true rescue nil

    add_index :cause_applications, :id, :unique => true rescue nil

    add_index :cause_types, :id, :unique => true rescue nil

    add_index :causes, :id, :unique => true rescue nil
    add_index :causes, :cause_type_id rescue nil
    add_index :causes, :city_id rescue nil
    add_index :causes, :postal_code rescue nil
    add_index :causes, :city rescue nil
    add_index :causes, :name rescue nil

    add_index :causes_cause_types, :id, :unique => true rescue nil
    add_index :causes_cause_types, :cause_id rescue nil
    add_index :causes_cause_types, :cause_type_id rescue nil

    add_index :cause_types, :id, :unique => true rescue nil

    add_column :featured_causes, :cause_id, :integer rescue nil

    add_index :featured_causes, :id, :unique => true rescue nil
    add_index :featured_causes, :cause_id rescue nil

    add_index :locations, :id, :unique => true rescue nil
    add_index :locations, [:latitude, :longitude] rescue nil
    add_index :locations, :city rescue nil
    add_index :locations, :cause_id rescue nil
    add_index :locations, :country rescue nil
    add_index :locations, :postal_code rescue nil

    add_index :needs, :id, :unique => true rescue nil
    add_index :needs, :type_of_need rescue nil
    add_index :needs, :cause_id rescue nil
    add_index :needs, :campaign_id rescue nil

    add_index :subscribes, :id, :unique => true rescue nil
    add_index :subscribes, :email rescue nil

    add_index :users, :id, :unique => true rescue nil

    add_index :users_badges, :id, :unique => true rescue nil
    add_index :users_badges, :user_id rescue nil
    add_index :users_badges, :user_id rescue nil

  end

end
