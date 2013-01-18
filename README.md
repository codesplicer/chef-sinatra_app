Sinatra App Cookbook
===========================
Super simple chef cookbook to deploy a sinatra app from a remote git repository.

Description
------------
This cookbook bootstraps an ubuntu server with:

* Apache
* Passenger (via Brightbox PPA repository)
* Git
* Sinatra


Requirements
-------------

### Chef
Tested on 0.10.18 but should work fine on older versions too.

### Platform
This has been tested using a stock Ubuntu 11.04 AMI without error. Given it uses the brightbox PPA to install passenger it won't work on non-debian based distos (i.e. CentOS)

### Cookbooks
This cookbook relies on the following additional community cookbooks:

* [apache2](https://github.com/opscode-cookbooks/apache2)
* [apt](https://github.com/opscode-cookbooks/apt)
* [git](https://github.com/opscode-cookbooks/git)


Attributes
-----------
The following attributes **must** be specified in your roles or environments in order to use the cookbook.

* `node['sinatra_app']['repository']` - The git URL for the repository you wish to deploy. e.g. git://github.com/codesplicer/test-sinatra-app.git
* `node['sinatra_app']['branch']` - The branch you wish to deploy. Default is master.
* `node['sinatra_app']['deploy_dir']` - The directory you wish to deploy to. e.g. e.g. /home/sites/awesome-app
* `node['sinatra_app']['docroot']` - The path where your code will run from. Will usually be your deploy directory with /current at the end. e.g. /home/sites/awesome-app/current
* `node['sinatra_app']['server_name']` - The URL you wish to host your app at. This sets the vhost server_name attribute and filename.


Usage
------
Using this cookbook is pretty straightforward. Heres an example of a basic role:

  ```
  name "Appserver"
  description "Servers that run our awesome sinatra-powered app"
  run_list(
    "recipe['sinatra_app::webserver']",
    "recipe['sinatra_app::deploy']"
  )
  default_attributes({
    "sinatra_app" => {
      "repository" => "git://github.com/codesplicer/test-sinatra-app.git",
      "branch" => "master",
      "deploy_dir" => '/home/ubuntu/newyork-newyork',
      "docroot" => '/home/ubuntu/newyork-newyork/current',
      "server_name" => 'newyork.example.com'
    }
  })
  ```

License and Author
===================

- Author:: Vik Bhatti (vik@vikbhatti.com)
