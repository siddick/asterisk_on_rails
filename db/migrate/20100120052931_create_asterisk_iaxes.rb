class CreateAsteriskIaxes < ActiveRecord::Migration
  def self.up
    create_table :asterisk_iaxes do |t|
      t.integer :pbx_id,                         :null => false
      t.string  :name,           :limit => 30,   :null => false
      t.string  :username,       :limit => 30
      t.string  :type,           :limit => 6,    :null => false
      t.string  :secret,         :limit => 50
      t.string  :md5secret,      :limit => 32
      t.string  :dbsecret,       :limit => 100
      t.string  :notransfer,     :limit => 10,                     :default => 'yes'
      t.string  :inkeys,         :limit => 100
      t.string  :outkeys,        :limit => 100
      t.string  :auth,           :limit => 100,  :null => false,   :default => 'md5'
      t.string  :accountcode,    :limit => 100
      t.string  :amaflags,       :limit => 100
      t.string  :callerid,       :limit => 100
      t.string  :context,        :limit => 100,  :null => false
      t.string  :defaultip,      :limit => 15
      t.string  :host,           :limit => 31,   :null => false,   :default => 'dynamic'
      t.string  :language,       :limit => 5
      t.string  :mailbox,        :limit => 50
      t.string  :deny,           :limit => 95
      t.string  :permit,         :limit => 95
      t.string  :qualify,        :limit => 4,                      :default => 'yes'
      t.string  :disallow,       :limit => 100,  :null => false,   :default => 'all'
      t.string  :allow,          :limit => 100,  :null => false,   :default => 'ulaw'
      t.string  :ipaddr,         :limit => 15
      t.integer :port,                                             :default => 0
      t.integer :regseconds,                                       :default => 0

      t.timestamps
    end

    add_index :asterisk_iaxes, [ :pbx_id, :username ] , :unique => true
  end

  def self.down
    drop_table :asterisk_iaxes
  end
end
