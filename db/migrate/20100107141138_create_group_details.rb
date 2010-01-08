class CreateGroupDetails < ActiveRecord::Migration
  def self.up
    create_table :group_details do |t|
      t.string        :name,        :limit => 25
      t.string        :description, :limit => 100
      t.string        :roles,       :limit => 500

      t.timestamps
    end

    GroupDetail.create({
      :name => 'admin',
      :description => 'Administrator',
      :roles => '*'
    })
    GroupDetail.create({
      :name => 'pbx_manager',
      :description => 'PBX Manager',
      :roles => ''
    })
    GroupDetail.create({
      :name => 'supervisor',
      :description => 'Supervisor',
      :roles => ''
    })
    GroupDetail.create({
      :name => 'user',
      :description => 'User',
      :roles => ''
    })
  end

  def self.down
    drop_table :group_details
  end
end
