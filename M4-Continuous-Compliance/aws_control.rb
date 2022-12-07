# describe aws_security_group(group_name: "sg-0073d0ec5d77fb8a7") do
#     it { should allow_in_only (port:8443, security_group: "security group name") }
# end

describe aws_security_group('sg-0073d0ec5d77fb8a7') do
    it { should exist }
end

# describe aws_ecr_images(repository_name: "repository name") do
#     its('count') { should cmp 5 }
# end