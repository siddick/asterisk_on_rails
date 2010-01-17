class CreateUserGroupMaps < ActiveRecord::Migration
  def self.up
    create_table :user_group_maps do |t|
      t.integer       :user_id
      t.integer       :group_id

      t.timestamps
    end

    add_index :user_group_maps, :group_id
    add_index :user_group_maps, [ :user_id, :group_id ], :unique => true

    UserGroupMap.create( :user_id => User.find_by_login_id('admin').id,
      :group_id => Group.find_by_name('admin').id )

    UserGroupMap.create( :user_id => User.find_by_login_id('siddick').id,
      :group_id => Group.find_by_name('manager').id )

    UserGroupMap.create( :user_id => User.find_by_login_id('siddick').id,
      :group_id => Group.find_by_name('user').id )

    UserGroupMap.create( :user_id => User.find_by_login_id('guest').id,
      :group_id => Group.find_by_name('user').id )

  end


  def self.down
    drop_table :user_group_maps
  end
end
