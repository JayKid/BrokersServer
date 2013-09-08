current_dir = File.dirname(__FILE__)                                                                                                         
chef_dir    = File.expand_path("#{current_dir}/../server")
cookbook_path ["#{chef_dir}/cookbooks"]