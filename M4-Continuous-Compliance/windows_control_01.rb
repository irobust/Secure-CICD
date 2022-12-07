describe security_policy do
  its('MinimumPasswordLength') { should be > 10 }
end