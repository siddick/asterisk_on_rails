class AsteriskExtension < ActiveRecord::Base
  belongs_to :pbx 

  serialize :config 
end
