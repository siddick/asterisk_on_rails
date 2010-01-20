require 'ami'

ami = AMI.new( 'localhost', 5038, 'siddick', 'siddick' )

#output = ami.write('getconfig', {'filename'=>'sip.conf'})
#print output.inspect , "\n"

#output = ami.write('events', {'eventmask'=>'sss'})
#output = ami.write('events')
#print output.inspect , "\n"
#
#while( ary = ami.read_array )
#		  print ary.inspect , "\n"
#end
#


output = ami.read_file( 'foo.conf' )
print output.inspect , "\n"

output['test']['test3'] = 'Testing'
output = ami.update_file( 'foo.conf', output )
print output.inspect , "\n"

output = ami.read_file( 'sip.conf' )
print output.inspect , "\n"


output = ami.update_file( 'sip.conf', { 'gold' => { 'type'=>'friend', 'host'=>'dynamic', 'secret'=>'gold' }})
print output.inspect , "\n"

output = ami.read_file( 'sip.conf' )
print output.inspect , "\n"

