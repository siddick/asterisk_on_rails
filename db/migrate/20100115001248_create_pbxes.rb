class CreatePbxes < ActiveRecord::Migration
  def self.up
    create_table :pbxes do |t|
      t.string          :name
      t.string          :description
      t.string          :type
      t.string          :host
      t.string          :username
      t.string          :password
      t.boolean         :active

      t.timestamps
    end

    add_index :pbxes, :name, :unique => true
    add_index :pbxes, :type

    Pbx.create( :name => 'local',
      :description => 'Local Asterisk',
      :type     => 'asterisk',
      :host     => 'localhost',
      :username => 'aor',
      :password => 'aor',
      :active   => true )
  end


  def self.down
    drop_table :pbxes
  end
end
