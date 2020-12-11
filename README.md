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

## PDF generation

You need to have `pandoc` and LaTeX installed.

The following LaTeX packages need to be installed:

- `koma-script`
- `setspace`
- `colortbl`
- `footnotebackref`
- `babel-english`
- `csquotes`
- `caption`
- `mdframed`
- `zref`
- `needspace`
- `sourcesanspro`
- `ly1`
- `sourcecodepro`
- `titling`
- `fancyhdr`
- `bookmark`
- `noto`
- `fontaxes`
- `listings`
- `pagecolor`

Build the PDF with the following command:

```
pandoc book/*.md \
    --template book/template.latex \
    --lua-filter=book/include-files.lua \
    --file-scope --toc -o book/book.pdf
```
