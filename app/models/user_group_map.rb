class UserGroupMap < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates_presence_of :user_id
  validates_presence_of :group_id
  
end
