class Group < ActiveRecord::Base
  has_many :users,  :through => :user_group_maps
  has_many :user_group_maps

  validates_presence_of :name
  validates_presence_of :description

end
