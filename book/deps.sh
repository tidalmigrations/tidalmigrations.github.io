# Basic install script for pdf generation dependencies on linux, works on debian

# Install pandoc
sudo apt install pandoc

# Install tinytex
wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh

# Install needed latex packages for our use
tlmgr install koma-script setspace colortbl footnotebackref babel-english csquotes caption mdframed zref needspace sourcesanspro ly1 sourcecodepro titling fancyhdr bookmark noto fontaxes listings pagecolor
