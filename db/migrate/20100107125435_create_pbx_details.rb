class CreatePbxDetails < ActiveRecord::Migration
  def self.up
    create_table :pbx_details do |t|
      t.string      :name,            :limit => 25, :unique => true
      t.string      :description,     :limit => 100
      t.string      :host,            :limit => 50
      t.string      :pbx_type,        :limit => 25
      t.string      :login_name,      :limit => 50
      t.string      :login_password,  :limit => 50

      t.timestamps
    end

    PbxDetail.create({
      :name => 'local_asterisk',
      :description => 'Local Asterisk',
      :host => 'localhost',
      :pbx_type => 'asterisk',
      :login_name => 'pbx',
      :login_password => 'pbx'
    })

  end

  def self.down
    drop_table :pbx_details
  end
end
