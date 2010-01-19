class CreateAsteriskSips < ActiveRecord::Migration
  def self.up
    create_table :asterisk_sips do |t|
      t.integer     :pbx_id,        :null => false
      t.integer     :commented,     :default => 0
      t.string      :name,          :limit => 80,  :default => ''
      t.string      :host,          :limit => 31,  :default => ''
      t.string      :nat,           :limit => 5,   :default => 'no'
      t.string      :type,          :limit => 6,   :default => 'friend' 
      t.string      :accountcode,   :limit => 20,  :default => nil
      t.string      :amaflags,      :limit => 13,  :default => nil
      t.string      :callgroup,     :limit => 10,  :default => nil
      t.string      :callerid,      :limit => 80,  :default => nil
      t.string      :cancallforward,:limit => 3,   :default => 'yes'
      t.string      :canreinvite,   :limit => 3,   :default => 'yes'
      t.string      :context,       :limit => 80,  :default => nil
      t.string      :defaultip,     :limit => 15,  :default => nil
      t.string      :dtmfmode,      :limit => 7,   :default => nil
      t.string      :fromuser,      :limit => 80,  :default => nil
      t.string      :fromdomain,    :limit => 80,  :default => nil
      t.string      :insecure,      :limit => 4,   :default => nil
      t.string      :language,      :limit => 2,   :default => nil
      t.string      :mailbox,       :limit => 50,  :default => nil
      t.string      :md5secret,     :limit => 80,  :default => nil
      t.string      :deny,          :limit => 95,  :default => nil
      t.string      :permit,        :limit => 95,  :default => nil
      t.string      :mask,          :limit => 95,  :default => nil
      t.string      :musiconhold,   :limit => 100, :default => nil
      t.string      :pickupgroup,   :limit => 10,  :default => nil
      t.string      :qualify,       :limit => 3,   :default => nil
      t.string      :regexten,      :limit => 80,  :default => nil
      t.string      :restrictcid,   :limit => 3,   :default => nil
      t.string      :rtptimeout,    :limit => 3,   :default => nil
      t.string      :rtpholdtimeout,:limit => 3,   :default => nil
      t.string      :secret,        :limit => 80,  :default => nil
      t.string      :setvar,        :limit => 100, :default => nil
      t.string      :disallow,      :limit => 100, :default => 'all'
      t.string      :allow,         :limit => 100,
          :default => 'g729,ilbc,gsm,ulaw,alaw'
      t.string      :fullcontact,   :limit => 80,  :default => '',
          :null => false  
      t.string      :ipaddr,        :limit => 15,  :default => '',
          :null => false
      t.integer     :port,          :null => false,:default => 0
      t.string      :regserver,     :limit => 100, :default => nil
      t.integer     :regseconds,    :null => false,:default => 0
      t.string      :username,      :limit => 80,  :default => '',
          :null => false

      t.timestamps
    end

    add_index :asterisk_sips, [ :pbx_id, :name ]
  end

  def self.down
    remove_index :asterisk_sips, [ :pbx_id, :name ]
    drop_table   :asterisk_sips
  end
end
