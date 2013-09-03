
require 'aws-sdk'

# This bit will need to be modified to use IAM credentials passed in via CloudFormation
ec2 = AWS::EC2.new(
	:access_key_id => ENV['AWS_ACCESS_KEY'],
	:secret_access_Key => ENV['AWS_SECRET_KEY']
)

topology "tier"

# Servers (get information about servers)
# This assumes that you have a tag key of 'private_chef' with the tag value being the role 
# 	you wish the server to take.
instances = ec2.instances.tagged('private_chef')

instances.each do |instance|
	server instance.private_dns_name, 
		:ipaddress => instance.ipaddress,
		:role => instance.tags.private_chef
end

api_fqdn "something"