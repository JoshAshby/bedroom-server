# create hashed password
use Crypt::PasswdMD5 qw(unix_md5_crypt);
print "Content-type: text/html \n\n";
my $plaintext = "joshua";
my @salt = ( '.', '/', 0 .. 9, 'A' .. 'Z', 'a' .. 'z' );
my $crypthash = unix_md5_crypt($plaintext, gensalt(8));
# verify password
my $crypthash1 = $crypthash;
my $plaintext1 = "joshua";
if ($crypthash1 eq unix_md5_crypt($plaintext1, $crypthash1)) {
	print "right";
}

sub gensalt {
  my $count = shift;
  my $salt;
  for (1..$count) {
    $salt .= (@salt)[rand @salt];
  }
  return $salt;
}


