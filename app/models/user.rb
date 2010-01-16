# == User
#   Handle the users table.
#
# === Relations
#
# === Validates
#   login_id      => Not Null, Limit(25), Unique 
#   md5_password  => Not Null
#   name          => Not Null, Limit(50)
#   group_id      => Not Null
#
class User < ActiveRecord::Base
  
  has_many :groups, :through => :user_group_maps
  has_many :user_group_maps

  validates_presence_of     :login_id
  validates_presence_of     :md5_password
  validates_presence_of     :name

  validates_length_of       :login_id,      :maximum=>25
  validates_length_of       :name,          :maximum=>50

  validates_uniqueness_of   :name

end
