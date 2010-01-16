class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string        :name
      t.string        :description
      t.boolean       :active

      t.timestamps
    end

    add_index :groups, :name, :unique => true

    Group.create( :name => 'admin', 
      :description => 'Admin', 
      :active => true )

    Group.create( :name => 'manager', 
      :description => 'Manager', 
      :active => true )

    Group.create( :name => 'user', 
      :description => 'Normal User', 
      :active => true )

    Group.create( :name => 'inactive', 
      :description => 'Inactive', 
      :active => false )
  end


  def self.down
    drop_table :groups
  end
end
