# DevOps教练的测试机准备

环境准备 environment variables:

```sh
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

确认模板 Validate the templates:

```sh
terraform plan
```

执行模板 Deploy the code:

```sh
terraform apply
```

在以上代码执行结束以后，成功的结果会返回 ec2 实例的公网 IP地址。 然后用 knife 配置这个节点。 When the `apply` command completes, it will output the public IP address of the server. 

Bootstrap 初始化节点 node.

```sh

martin@mbp:~/chef-repo $ pwd
/Users/martin/chef-repo

martin@mbp:~/chef-repo $ knife bootstrap -k /Users/martin/chef-repo/.chef/martinliu.pem --ssh-user centos --sudo  -i ~/test-tokyo.pem $public_ip  -N docker1 --run-list "recipe[workstation],recipe[mydocker],recipe[myjava]" -y

```

Clean up when you're done:

```bash

terraform destroy

```


 knife bootstrap  --ssh-user centos --sudo   $public_ip  -N docker1 --run-list "recipe[workstation],recipe[mydocker]" -y