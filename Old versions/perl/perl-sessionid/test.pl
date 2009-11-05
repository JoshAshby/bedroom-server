#!/usr/bin/perl
use CGI::Session;
use CGI;

$form=new CGI;
$f_name=CGI::escapeHTML($form->param("f_name"));

$session = CGI::Session->load() or die CGI::Session->errstr();

if ($f_name)
{
$session->param('username', $f_name);
}

if ($session->is_expired)
{
    print $session->header();
    print <<"ABC";

<html>
<head>
</head>
<body>

ABC

    print "Your session timed out! Refresh the screen to start new session!";

    print <<"ABC";

</body>
</html>

ABC
    exit(0);
}

if ($session->is_empty)
{
    $session = $session->new() or die $session->errstr;
}

print $session->header();

print <<"ABC";

<html>
<head>
</head>
<body>

ABC

$n_name = $session->param("username");
if ($n_name eq 'Josh Ashby')
{
print "Welcome, $n_name";
print <<"ABC";

</body>
</html>

ABC

} else {
print <<"ABC";

<form action=test.pl method=get>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>Username:</td><td> <input type=text size=20 name=f_name></td></tr>
<tr><td></td><td><input type=submit border=0 value=\"Login\"></td></tr>
</table>
</form>
</body>
</html>

ABC

}
