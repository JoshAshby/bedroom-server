#!/usr/bin/perl
use CGI::Session;
use CGI;
use DBI;
use CGI::Carp qw(fatalsToBrowser);

#create a new CGI object.
my $cgi = new CGI;
$CGI::DISABLE_UPLOADS = 1;          # Disable uploads
$CGI::POST_MAX        = 512 * 1024; # limit posts to 512K max

#try to retrieve cookie.  
my $sid = $cgi->cookie("CGISESSID") || undef;

#create session... If I retrieved a previous session id, reconnect to it. 
#if not, create a new session.
my $session = new CGI::Session(undef, $sid, {Directory=>'./temp'});

print $session->param("days");
