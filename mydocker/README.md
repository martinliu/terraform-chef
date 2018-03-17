# mydocker

引用Chef官方Docker配方，安装和启动Docker服务。

## 使用方法

```bash

knife bootstrap --ssh-user centos --sudo  -i ~/test-tokyo.pem $public_ip  -N docker-host1  --run-list "recipe[mydocker]"

```


https://www.terraform.io/docs/provisioners/chef.html

