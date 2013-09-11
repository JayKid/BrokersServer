name "api"
description "Systems that exposes the REST api"
run_list(
  "recipe[apt]",
  "recipe[apache2]",
  "recipe[apache2::mod_php5]",
  "recipe[apache2::mod_ssl]",
  "recipe[mysql::client]",
  "recipe[api::vhost]"
)

default_attributes(
  "apache" => {
    "listen_ports" => ["80", "443"]
  },
  "api" => {
  	"web_dir" 	=> "/var/www/code/api/web/",
  	"alias" 	=> "localhost"
  }
)