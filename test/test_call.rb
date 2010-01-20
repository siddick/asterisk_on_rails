require 'ami'
ami = AMI.new( 'localhost', 5038, 'siddick', 'siddick' )

#ami.write( 'originate', { 'channel'=>'SIP/siddick', 'exten' => '500', 'pontext' => 'demo', 'priority' => '1'  } )
#ami.write( 'originate', { 'channel'=>'SIP/siddick', 'application' => 'dial', 'data'=>'local/500@demo' } )
#

#output = ami.originate( 'SIP/siddick', { 'exten' => '500', 'pontext' => 'demo', 'priority' => '1'  } )
#output = ami.originate( 'SIP/siddick', { 'application' => 'dial', 'data'=>'local/500@demo'  } )
output = ami.originate( 'SIP/siddick', { 'application' => 'playback', 'data'=>'demo-abouttotry'  } )


#output = ami.read
print output.inspect, "\n"

while( true )
	output = ami.read_hash( false )
	print output.inspect, "\n"
end
