class CreateConfigFiles < ActiveRecord::Migration
  def self.up
    create_table :config_files do |t|
      t.integer       :pbx_id
      t.string        :type,        :limit => 25
      t.string        :context,     :limit => 100
      t.text          :config

      t.timestamps
    end

    add_index :config_files, [ :pbx_id, :type, :context ]

    ConfigFileTest.create( :pbx_id => Pbx.find_by_name('local').id,
      :context => 'globel',
      :config => {:min => 5, :max => 50 } )

  end


  def self.down
    drop_table :config_files
  end
end
