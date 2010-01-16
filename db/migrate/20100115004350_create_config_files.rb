class CreateConfigFiles < ActiveRecord::Migration
  def self.up
    create_table :config_files do |t|
      t.integer       :pbx_id
      t.string        :type,        :limit => 25
      t.string        :name,        :limit => 100
      t.text          :config

      t.timestamps
    end

    add_index :config_files, :pbx_id
    add_index :config_files, [ :pbx_id, :type ]
    add_index :config_files, [ :pbx_id, :type, :name ]

    ConfigFile.create( :pbx_id => Pbx.find_by_name('local').id,
      :type => 'TEST',
      :name => 'globel',
      :config => ({:min => 5, :max => 50 }.to_json) )

  end


  def self.down
    drop_table :config_files
  end
end
