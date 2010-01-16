class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string        :login_id,      :limit => 25
      t.string        :md5_password,  :limit => 50
      t.string        :name,          :limit => 50
      t.boolean       :active
      t.timestamp     :login_at
      t.string        :login_status,  :limit => 25

      t.timestamps
    end

    add_index :users, :login_id, :unique => true 

    User.create( :login_id => 'admin',
      :md5_password => Digest::MD5.hexdigest('admin'),
      :name => 'Admin',
      :active => true,
      :login_at => Time.now(),
      :login_status => 'logout' )

    User.create( :login_id => 'siddick',
      :md5_password => Digest::MD5.hexdigest('siddick'),
      :name => 'Mohammed Siddick.E',
      :active => true,
      :login_at => Time.now(),
      :login_status => 'logout' )

    User.create( :login_id => 'guest',
      :md5_password => Digest::MD5.hexdigest('guest'),
      :name => 'Guest',
      :active => true,
      :login_at => Time.now(),
      :login_status => 'logout' )

  end

  def self.down
    drop_table :users
  end
end
