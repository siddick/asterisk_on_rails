class CreatePbxes < ActiveRecord::Migration
  def self.up
    create_table :pbxes do |t|
      t.string          :name
      t.string          :description
      t.string          :type
      t.string          :host
      t.text            :config
      t.boolean         :active

      t.timestamps
    end

    add_index :pbxes, :name, :unique => true

    PbxAsterisk.create( :name => 'local',
      :description => 'Local Asterisk',
      :host     => 'localhost',
      :config   => { :username => 'aor', :password => 'aor' } ,
      :active   => true )

  end


  def self.down
    drop_table :pbxes
  end
end
