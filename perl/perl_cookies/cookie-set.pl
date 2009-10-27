#!/bin/perl
use CGI;
$query = new CGI;

$cookie = $query->cookie(-name=>'perl_login',
			 -value=>'perllogin=YES',
			 -expires=>'+4h',
			 -path=>'/');


print $query->header(-cookie=>$cookie);

print $query->start_html('cookie | write');
print $query->p('finished');

print $query->end_html;
