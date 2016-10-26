#!/usr/bin/env bash

set -e
set -x

echo "install perl stuff goes here"
# The default perlbrew root directory is ~/perl5/perlbrew, which can be changed by setting PERLBREW_ROOT
open -b com.google.chrome http://perlbrew.pl/
curl -L http://install.perlbrew.pl | bash
perlbrew install perl-5.16.0
perlbrew switch perl-5.16.0
perlbrew install-cpanm
# perlbrew exec perl myprogram.pl
# perlbrew help

exit 0
