package 'tree' do
  action :install
end

package 'ntp' do
  action :install
end

package 'git' do
  action :install
end

template '/etc/motd' do
  source 'motd.erb'
  action :create
end

service 'firewalld' do
  action [ :stop, :disable ]
end


