class ConfigFile < ActiveRecord::Base
  belongs_to :pbx

  serialize :config

  validates_presence_of :pbx_id
  validates_presence_of :type
  validates_presence_of :context
  validates_presence_of :config

end
