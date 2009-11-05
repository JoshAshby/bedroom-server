#!/usr/bin/perl
use CGI;
use Apache::Session::File;

my $query = new CGI;
my %session;
my $id = undef;

$id = $query->cookie(-name=>"SID01");

tie %session, 'Apache::Session::File', $id,
           { Directory => "/tmp/",
           LockDirectory => "/tmp/"};

if ($id == undef) {
     $cookie = $query->cookie( -name=>'SID01',
                 -value=>$session{_session_id},
                 -expires=>'+1y',
                 -path=>'/session');
     print $query->header(-cookie=>$cookie);
     print "Assigned session ID<br>n";
} else {
     print $query->header();
     print "Not assigned session ID<br>n";
};

if ($query->param()) {
     $session{"name"} = $query->param("name");
     $session{"address"} = $query->param("address");
     $session{"birthday"} = $query->param("birthday");
}

print "<html>n";
print " <head><title>Session info</title></head>n";
print " <body bgcolor=#ffffff>n";
print " <form action='/session/userinfo.cgi' method=post>n";
print " <b>Name: </b>";
print " <input type=text size=12 name='name' value='".$session{'name'}."'><br>n";
print " <b>Address: </b>";
print " <input type=text size=12 name='address' value='".$session{'address'}."'><br>n";
print " <b>Birthday: </b>";
print " <input type=text size=12 name='birthday' value='".$session{'birthday'}."'><br>n";
print " <input type=submit></form>n";
print " Your session ID is $idn";
print " </body>n";
print "</html>n";
