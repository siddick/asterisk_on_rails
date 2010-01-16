class Pbx < ActiveRecord::Base
  has_many :config_files

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :type
  validates_presence_of :host
  validates_presence_of :username
  validates_presence_of :password
  validates_presence_of :active

  validates_uniqueness_of :name

end
