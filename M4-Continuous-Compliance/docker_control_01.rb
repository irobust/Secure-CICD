describe docker_container(name: 'crazy_noether') do
    its('image') { should eq 'rabbitmq' }
end