require 'socket'
require 'thread'
require 'ami/ami_methods'
require 'ami/file_handler'
require 'ami/sip'

class AMI
		  def initialize( host, port, username, password )
					 connect( host, port )
					 login( username, password )
		  end
		  include AMIMethods
		  include FileHandler
end
