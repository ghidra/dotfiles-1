#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install various GNU binaries via coreutils etc.
# Note: If already installed, change "install" to "reinstall"
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt --with-default-names

# Tell .bash_profile about .bash_profile and prepend the gnubin to our PATH
echo -e '#!/usr/bin/env bash\n\nsource $HOME/.bash_profile\nPATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"\nexport PATH' > $HOME/.bash_profile

