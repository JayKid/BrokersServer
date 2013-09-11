name "db"
description "Systems that hosts the MySQL DB"
run_list(
  "recipe[apt]",
  "recipe[mysql]",
  "recipe[mysql::server]",
  "recipe[mysql::client]",
  "recipe[api::db]"
)

default_attributes(
  "mysql" => {
    "server_root_password" => "secret",
    "server_repl_password" => "secret",
    "server_debian_password" => "secret"
  },
  "api" => {
     "database" => {
        "name" => "market",
        "user" => "market",
        "password" => "themarket"
     }
  }
)

