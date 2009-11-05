#!/usr/bin/perl -l
# verify password
my $crypthash = "SA01VjfokepR.";
my $plaintext = "joshua";
if ($crypthash eq unix_md5_crypt($plaintext, $crypthash)) {
	print "right";
}
