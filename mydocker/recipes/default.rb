#
# Cookbook:: mydocker
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

## install and start docker
docker_service 'default' do
  group 'dockerroot'
  action [:create, :start]
end

