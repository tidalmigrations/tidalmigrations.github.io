# Tidal

A set of guides on how to use the Tidal API and Tidal Tools.


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

## PDF generation

You need to have [`pandoc`](https://pandoc.org/installing.html) and LaTeX
(`lualatex`) installed. We suggest using
[TinyTex](https://yihui.name/tinytex/) because it is lightweight,
cross-platform, portable, and easy-to-maintain.

The following LaTeX packages need to be installed:

- `environ`
- `everypage`
- `fancyhdr`
- `luatexbase`
- `noto`
- `pgf`
- `selnolig`
- `sourcecodepro`
- `tcolorbox`

The above packages could be easily installed on Debian Stable by running `./book/deps.sh` script.

Build PDF files with the following command:

```
make -j8 book
```
