current_dir = File.dirname(__FILE__)                                                                                                         
chef_dir    = File.expand_path("#{current_dir}/..")
cookbook_path ["#{chef_dir}/cookbooks"]