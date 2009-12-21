module AMIMethods 
	def connect( host, port )
		@socket = TCPSocket.new( host, port )
		@socket.gets
		@count  = "000000"
	end

	def login( username, password )
		ary = write( 'login', {'username'=>username, 'secret'=>password} )
		if( !ary or !ary[0] or ary[0] !~ /^Response: Success$/i )
			raise "Login Failed"
		end
	end

	def get_new_action_id
		@count.next!
	end

	def read_array
		data = []
		while( line = @socket.gets )
			line.strip!
			break if( line == '' )
			data.push( line )
		end
		data
	end

	def write_array( data )
		tmp_data = data.join("\r\n") + "\r\n\r\n"
		@socket.write( tmp_data )
	end

	def read()
		data = read_array()
	end

	def write_only( action, data = nil )
		tmp_data = []
		tmp_data.push( "action: #{action}" )
		tmp_data.push( "actionid: #{get_new_action_id}" )
		if( data && data.size > 0 )
			data.each{|val|
				tmp_data.push( val.join(": ") )
			}
		end
		write_array( tmp_data )
	end

	def write( action, data = nil)
		write_only( action, data )
		return read()
	end

	def file( filename )
		AMI::File.new( self, filename )
	end

end
