
web_app "api" do
  server_name node['hostname']
  server_aliases [node['fqdn'], node['api']['alias']]
  docroot node['api']['web_dir']
end