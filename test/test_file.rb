require 'ami'
ami = AMI.new( 'localhost', 5038, 'siddick', 'siddick' )

output = ami.copy_file( 'sip.conf.backup', 'sip.conf' )
print output.inspect, "\n\n"

config = ami.read_file('sip.conf')
print config.inspect , "\n\n"

#config['maran'] = config['siddick']
output = ami.write_file( 'sip.conf', config )
#output = ami.update_file( 'sip.conf', { maran: config['siddick'] } )
#output = ami.write_file( 'sip.conf', { maran: config['siddick'] } )
print output.inspect, "\n\n"

output = ami.read( false )
print output.inspect, "\n\n"

config = ami.read_file('sip.conf')
print config.inspect , "\n\n"

