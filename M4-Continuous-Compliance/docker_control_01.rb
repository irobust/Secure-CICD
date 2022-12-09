describe docker_container(name: 'nervous_robinson') do
    its('image') { should eq 'rabbitmq' }
end