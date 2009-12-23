module AMIMethods 
	def connect( host, port )
		@socket = TCPSocket.new( host, port )
		@socket.gets
		@count  = "000000"
	end

	def login( username, password )
		write( 'login', {'username'=>username, 'secret'=>password} )
		ary = read_array()
		if( !ary or !ary[0] or ary[0] !~ /^Response: Success$/i )
			raise "Login Failed"
		end
	end

	def get_new_action_id
		@count.next!
	end

	def read_hash( no_event = true )
		ary  = read_array( no_event )
		hash = {}
		ary.each{|line|
			if( line =~ /^([^:]*): (.*)$/ )
				key = $1.dup
				value = $2.dup
				if( hash[key] )
					if( hash[key].class == Array )
						hash[key].push( value )
					else
						hash[key] = [ hash[key], value ]
					end
				else
					hash[key] = value 
				end
			end
		}
		return hash
	end
	def read_array( no_event = true )
		while( true )
			data = []
			while( line = @socket.gets )
				line.strip!
				break if( line == '' )
				data.push( line )
			end
			if( !no_event || data[0] !~ /^Event:/ )
				return data
			end
		end
	end

	def write_array( data )
		tmp_data = data.join("\r\n") + "\r\n\r\n"
		@socket.write( tmp_data )
	end

	def read( no_event = true )
		read_array( no_event )
	end

	def write( action, data = nil )
		action_id = get_new_action_id
		tmp_data = []
		tmp_data.push( "action: #{action}" )
		tmp_data.push( "actionid: #{action_id}" )
		if( data && data.size > 0 )
			data.each{|val|
				tmp_data.push( val.join(": ") )
			}
		end
		write_array( tmp_data )
		return action_id
	end


end
