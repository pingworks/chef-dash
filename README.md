# chef-dash-cookbook

## Supported Platforms

Debian 7.x (wheezy)

## Attributes

## Usage

### chef-dash::dash-prod

Include `chef-dash::dash-prod` in your node's `run_list` to install the dashboard wirh 'production' settings:

```json
{
  "run_list": [
    "recipe[chef-dash::dash-prod]"
  ]
}
```

### chef-dash::dash-dev

To setup a development environment:

Clone https://github.com/hybris/dash.git

into a folder right beside chef-dash, changedir into chef-dash and run vagrant up.

For example:

cd workspace

git clone git@github.com:hybris/dash.git

git clone git@github.com:hybris/chef-dash.git

cd chef-dash

vagrant up

Point your browser to

http://localhost:8080/

and you have a running dashboard.

## Attributes

Set a default for using a corporate repo for packages or not.
Defaults to false.
If this attribute is set to true, we must provide as a cookbook_file the publickey of the
corporate package repo,in a **WRAPPER** cookbook. This cookbook_file is then provisioned by the add-apt-key recipe.
The add-apt-key recipe is called based on this attribute Boolean value being true.
If this attribute is set to the default value of false, the apt_repository resource
is invoked to get the key for the Pingworks debian repo.

```
default['chef-dash']['use-corp-repo'] = false
```

## License and Authors
Licensed under
Apache v2.0 License

Author:: Christoph Lukas (<lukas@pingworks.de>)
Author:: Alexander Birk (<birk@pingworks.de>)

