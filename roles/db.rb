name "db"
description "Systems that hosts the MySQL DB"
run_list(
  "recipe[apt]",
  "recipe[mysql]",
  "recipe[mysql::server]"
)

default_attributes(
  "mysql" => {
    "server_root_password" => "secret",
    "server_repl_password" => "secret",
    "server_debian_password" => "secret"
  }
)