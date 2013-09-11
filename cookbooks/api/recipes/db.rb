include_recipe "database::mysql"

mysql_connection_info = {
  :host => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database node['api']['database']['name'] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node['api']['database']['user'] do
  connection mysql_connection_info
  password node['api']['database']['password']
  database_name node['api']['database']['name']
  host '%'
  action :grant
end