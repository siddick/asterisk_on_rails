class Pbx < ActiveRecord::Base

  serialize :config

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :type
  validates_presence_of :host
  validates_presence_of :config
  validates_presence_of :active

  validates_uniqueness_of :name

end
