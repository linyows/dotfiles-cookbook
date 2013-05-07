# Cookbook: dotfiles
# Recipe: default
# Copyright 2013 All rights reserved

u = data_bag_item('users', node[:dotfiles][:data_bag_user_id])
home = u['home'] || u['id'] == 'root' ? "/root" : "/home/#{u['id']}"
project_path = "#{home}/.#{u['dotfiles']['resource'].match(/.*\/(\w+)\.git/)[1]}"

bash "before_deploy" do
  user u['id']
  cwd home
  environment "HOME" => home
  code <<-EOF
    #{u['dotfiles']['before_deploy']}
  EOF
end if u['dotfiles']['before_deploy']

git project_path do
  repository u['dotfiles']['resource']
  reference "master"
  action :checkout
  user u['id']
end

bash "after_deploy" do
  user u['id']
  cwd project_path
  environment "HOME" => home
  code <<-EOF
    #{u['dotfiles']['after_deploy']}
  EOF
end if u['dotfiles']['after_deploy']

user u['id'] do
  action :modify
  shell u['dotfiles']['shell']
end if u['dotfiles']['shell']
