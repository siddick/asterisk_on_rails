class CreateAsteriskExtensions < ActiveRecord::Migration
  def self.up
    create_table :asterisk_extensions do |t|
        t.integer   :pbx_id,      :null => false
	     t.integer   :commented,   :null => false, :default => 0
        t.string    :context,     :limit => 80, :null => false,
            :default => ''
        t.string    :exten,       :limit => 40, :null => false,
            :default => ''
        t.text      :config

      t.timestamps
    end

    add_index :asterisk_extensions, [ :pbx_id, :context, :exten ]
  end

  def self.down
    remove_index :asterisk_extensions, [ :pbx_id, :context, :exten ]
    drop_table   :asterisk_extensions
  end
end
