class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string        :login_id,      :limit => 25, :unique => true
      t.string        :md5_password,  :limit => 50
      t.string        :name,          :limit => 50
      t.integer       :group_id
      t.timestamp     :login_at
      t.string        :login_status,  :limit => 25

      t.timestamps
    end

    User.create( :login_id => 'admin',
      :md5_password => Digest::MD5.hexdigest('admin'),
      :name => 'Admin',
      :group_id => 1,
      :login_at => Time.now(),
      :login_status => 'logout' );

    User.create( :login_id => 'siddick',
      :md5_password => Digest::MD5.hexdigest('siddick'),
      :name => 'Mohammed Siddick.E',
      :group_id => 1,
      :login_at => Time.now(),
      :login_status => 'logout' );

  end

  def self.down
    drop_table :users
  end
end
