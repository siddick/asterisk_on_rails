module FileHandler

	def copy_file( from_filename, to_filename )
		write( 'updateconfig', { 'srcfilename' => from_filename,
				 'dstfilename' => to_filename } );
		read_array
	end

	def read_file( filename )
		write( 'getconfig', { 'filename'=>filename } )
		ary = read_array
		if( !ary or !ary[0] or ary[0] !~ /^Response: Success$/i )
			raise "File Open Error"
		end
		parse_file_config( ary )
	end

	def update_file( filename, config, truncate = false )
		old_config = read_file( filename )
		operations = []
		count = '000000'
		operations.push( "action: updateconfig" )
		operations.push( "srcfilename: #{filename}" )
		operations.push( "dstfilename: #{filename}" )
		operations.push( "reload: yes" )

		if( truncate )
			old_config.each{|cat,values|
				do_config( operations, count, 'delcat', cat )
				count.next!
			}
		end

		config.each{|cat, data|
			if( !truncate and old_config[cat] )
				do_config( operations, count, 'delcat', cat )
				count.next!
			end
			do_config( operations, count, 'newcat', cat )
			count.next!
			data.each{|var,value|
				if( value.class == Array )
					value.each{|val|
						do_config( operations, count, 'append', cat, var, val )
						count.next!
					}
				else
					do_config( operations, count, 'append', cat, var, value )
					count.next!
				end
			}
		}
		write_array( operations )
		return read()
	end

	def write_file( filename, config )
		update_file( filename, config, true )
	end

	private 
	def do_config( opts, count, action, cat, var=nil, value=nil, match=nil, line =nil)
		opts.push( "action-#{count}: #{action}" )
		opts.push( "cat-#{count}: #{cat}" )
		opts.push( "var-#{count}: #{var}" ) if( var )
		opts.push( "value-#{count}: #{value}" ) if( value )
		opts.push( "match-#{count}: #{value}" ) if( match )
		opts.push( "line-#{count}: #{value}" ) if( line )
		return opts
	end
	def parse_file_config( ary )
		config   = {}
		last_cat = nil
		ary.each{|line|
			if( line =~ /^Category-[0-9]*: (.*)$/ )
				last_cat 				= $1.dup
				config[last_cat] 	||= {}
			elsif( line =~ /^Line-[0-9]*-[0-9]*: ([^=]*)=(.*)$/ )
				var 	= $1.dup
				value 	= $2.dup
				if( bk_value = config[last_cat][var] )
					if( bk_value.class == Array )
						bk_value.push( value )
					else
						config[last_cat][var] = [ bk_value, value ]
					end
				else
					config[last_cat][var] = value
				end
			end
		}
		return config
	end
end
