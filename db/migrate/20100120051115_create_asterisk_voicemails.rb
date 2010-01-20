class CreateAsteriskVoicemails < ActiveRecord::Migration
  def self.up
    create_table :asterisk_voicemails do |t|
      t.integer :pbx_id,                       :null => false
      t.string  :customer_id,   :limit => 11,  :null => false, :default => '0'
      t.string  :context,       :limit => 50,  :null => false, :default => ''
      t.string  :mailbox,       :limit => 11,  :null => false, :default => '0'
      t.string  :password,      :limit => 11,  :null => false, :default => '0'
      t.string  :fullname,      :limit => 150, :null => false, :default => ''
      t.string  :email,         :limit => 50,  :null => false, :default => ''
      t.string  :pager,         :limit => 50,  :null => false, :default => ''
      t.string  :tz,            :limit => 10,  :null => false, :default => 'EST'
      t.string  :attach,        :limit => 4,   :null => false, :default => 'yes'
      t.string  :saycid,        :limit => 4,   :null => false, :default => 'yes'
      t.string  :dialout,       :limit => 10,  :null => false, :default => ''
      t.string  :callback,      :limit => 10,  :null => false, :default => ''
      t.string  :review,        :limit => 4,   :null => false, :default => 'no'
      t.string  :operator,      :limit => 4,   :null => false, :default => 'no'
      t.string  :envelope,      :limit => 4,   :null => false, :default => 'no'
      t.string  :sayduration,   :limit => 4,   :null => false, :default => 'no'
      t.integer :saydurationm,                 :null => false, :default => '1'
      t.string  :sendvoicemail, :limit => 4,   :null => false, :default => 'no'
      t.string  :delete,        :limit => 4,   :null => false, :default => 'no'
      t.string  :nextaftercmd,  :limit => 4,   :null => false, :default => 'yes'
      t.string  :forcename,     :limit => 4,   :null => false, :default => 'no'
      t.string  :forcegreetings,:limit => 4,   :null => false, :default => 'no'
      t.string  :hidefromdir,   :limit => 4,   :null => false, :default => 'yes'
      t.timestamp :stamp,                      :null => false#, :default => now()

      t.timestamps
    end

    add_index :asterisk_voicemails, [ :pbx_id, :context, :mailbox ], :unique => true
  end

  def self.down
    drop_table :asterisk_voicemails
  end
end
