# Basic install script for pdf generation dependencies on linux, works on debian

# Install pandoc, we use version 2.11.2
wget https://github.com/jgm/pandoc/releases/download/2.11.2/pandoc-2.11.2-1-amd64.deb
sudo dpkg -i pandoc-2.11.2-1-amd64.deb

# Install tinytex
wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh

# Install needed latex packages for our use
tlmgr install \
  environ \
  everypage \
  fancyhdr \
  luatexbase \
  noto \
  pgf \
  selnolig \
  sourcecodepro \
  tcolorbox
