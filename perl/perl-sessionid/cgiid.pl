#!/usr/bin/perl
use CGI::Session;
use CGI;
use DBI;
use CGI::Carp qw(fatalsToBrowser);

my $cgi = new CGI;
$CGI::DISABLE_UPLOADS = 1;          # Disable uploads
$CGI::POST_MAX        = 512 * 1024; # limit posts to 512K max

#create a new session
my $session = new CGI::Session(undef, undef, {Directory=>'./temp'});


#set session to expire in 1 hour
$session->expire("+1h");
	
#store something
$session->param("days","Friday");
		
#write to disk
$session->flush();


#create the cookie with a 1hour limit.. 
my $cookie = $cgi->cookie(-name=>"CGISESSID",
		                           -value=>$sid,
		                           -expires=>"+1h",
		                           -path=>"/");
		
#set the cookie..
print $cgi->header(-cookie => $cookie );
