# Tidal Migrations

A set of guides on how to use the Tidal Migrations API and Tidal Tools.


## Development

To run the site locally you will need:

- [Ruby](https://www.ruby-lang.org/en/) installed.
- `gem install bundler` or `sudo dnf install rubygem-bundler` (RHEL/CentOS/Fedora) or `sudo apt install bundler` (Debian/Ubuntu)
- Set the `$GEM_HOME` environment variable. 
    - Check if it is set with `env | grep GEM_HOME`
    - If it is not set, set it with `export GEM_HOME=$(ruby -r rubygems -e 'puts Gem.user_dir')`
    

To install the needed dependencies:

`bundle install`


To run [jekyll](https://jekyllrb.com/) and start hacking run:

`jekyll server`


You should see the rendered site on http://localhost:4000
