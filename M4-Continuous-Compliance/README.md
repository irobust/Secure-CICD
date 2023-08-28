# Continuous Compliant
## Chef Inspec
* inspec exec linux_control_01.rb
* inspec exec docker_control_01.rb
* inspec detect -t aws://
* inspec detect -t aws://[region]/[profile]
* inspec exec inside-container_01.rb -t docker://[Container-ID]
* inspec exec inside-container_01.rb -t ssh://[User]@[Server-IP]
* git clone https://github.com/dev-sec/linux-baseline
* inspec exec linux-baseline-master/-t docker://[Container-ID]
* inspec exec https://github.com/dev-sec/cis-docker-benchmark
* inspec exec https://github.com/dev-sec/cis-kubernetes-benchmark
* inspec supermarket profiles
* inspec supermarket exec dev-sec/linux-baseline -t docker://[Container-ID]
* inspec init profile --platform os my-profile
* inspec check my-profile
* inspec vendor
* inspec shell
  - help
  - help resources
  - help file
  - file('/path/to/file').exists?
  - file('/path/to/file').content
  - file('/path/to/file').methods
* inspec shell -t ssh://[User]@[Server-IP] -i [key.pem] 
* inspec shell -t docker://[Container-ID]
* inspec init profile --platform aws aws-profile
* inspec shell --depends aws-profile -t aws://ap-southeast-1
  - aws_ec2_instances.instance_ids
  - aws_ec2_instance('instance-id').exists?
  - aws_ec2_instance('instance-id').instance_type
  - aws_ec2_instance('instance-id').vpc_id
