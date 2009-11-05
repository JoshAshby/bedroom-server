#!/bin/perl
use CGI;
$query = new CGI;

print $query->header;

print $query->start_html('cookie | read');

print $query->p('cookie reads:');
$theCookie = $query->cookie('perl_login');
 
print $theCookie;

print $query->end_html;
