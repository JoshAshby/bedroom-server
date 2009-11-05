#!/usr/bin/perl
use Apache::Session::MySQL;
 use Apache;

 use strict;

 #read in the cookie if this is an old session

 my $r = Apache->request;
 my $cookie = $r->header_in('Cookie');
 $cookie =~ s/SESSION_ID=(\w*)/$1/;

 #create a session object based on the cookie we got from the browser,
 #or a new session if we got no cookie

 my %session;
 tie %session, 'Apache::Session::MySQL', $cookie, {
      DataSource => 'dbi:mysql:sessions', #these arguments are
      UserName   => 'root',         #required when using
      Password   => 'speeddyy5',           #MySQL.pm
      LockDataSource => 'dbi:mysql:sessions',
      LockUserName   => 'root',
      LockPassword   => 'speeddyy5'
 };

 #Might be a new session, so lets give them their cookie back

 my $session_cookie = "SESSION_ID=$session{_session_id};";
 $r->header_out("Set-Cookie" => $session_cookie);
