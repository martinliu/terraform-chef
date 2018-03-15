# Docker Service Example

environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

Validate the templates:

```
terraform plan
```

Deploy the code:

```
terraform apply
```

When the `apply` command completes, it will output the public IP address of the server. 

Bootstrap docker service node.

```
martin@mbp:~/chef-repo $ pwd
/Users/martin/chef-repo

martin@mbp:~/chef-repo $ knife bootstrap  --ssh-user centos --sudo  -i ~/test-tokyo.pem $public_ip  -N docker1 --run-list "recipe[workstation],recipe[mydocker]" -y
```

Clean up when you're done:

```
terraform destroy
```