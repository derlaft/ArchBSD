# Set path to perl scriptdirs if they exist
# https://wiki.archlinux.org/index.php/Perl_Policy#Binaries_and_Scripts
# Added /usr/bin/*_perl dirs for scripts
# Remove /usr/lib/perl5/*_perl/bin in next release

[ -d /usr/local/bin/site_perl ] && PATH=$PATH:/usr/local/bin/site_perl
[ -d /usr/local/lib/perl5/site_perl/bin ] && PATH=$PATH:/usr/local/lib/perl5/site_perl/bin

[ -d /usr/local/bin/vendor_perl ] && PATH=$PATH:/usr/local/bin/vendor_perl
[ -d /usr/local/lib/perl5/vendor_perl/bin ] && PATH=$PATH:/usr/local/lib/perl5/vendor_perl/bin

[ -d /usr/local/bin/core_perl ] && PATH=$PATH:/usr/local/bin/core_perl

export PATH

# If you have modules in non-standard directories you can add them here.
#export PERLLIB=dir1:dir2

