#!/usr/bin/perl
use DBI;
use DBD::mysql;
use CGI;

$form=new CGI;
$f_id=CGI::escapeHTML($form->param("f_id"));
$f_date=CGI::escapeHTML($form->param("f_date"));
$f_post=CGI::escapeHTML($form->param("f_post"));

print "Content-type: text/html \n\n";

$platform = "mysql";
$database = "perl";
$host = "localhost";
$port = "3306";
$tablename = "pl_db";
$user = "root";
$pw = "speeddyy5";
$dsn = "dbi:mysql:$database:localhost:3306";
$connect = DBI->connect($dsn, $user, $pw) or die "Couldn't connect to database!" . DBI->errstr;
$query = "SELECT * FROM $tablename ORDER BY id desc";
$query_handle = $connect->prepare($query);
$query_handle->execute();
$query_handle->bind_columns(undef, \$id, \$date, \$post);

print <<"A";

<html>
<head>
  <meta content="text/html; charset=ISO-8859-1"
 http-equiv="content-type">
  <title>Perl and MySQL Test 10-21</title>
</head>
<body>
Posts:<br>

A

if($f_id && $f_id != $id) {
$queryw = "INSERT INTO $tablename VALUES ('$f_id', '$f_date', '$f_post')";
$query_handlew = $connect->prepare($queryw);
$query_handlew->execute();
$query_handlew->finish();

$queryr = "SELECT * FROM $tablename ORDER BY id desc";
$query_handler = $connect->prepare($query);
$query_handler->execute();
$query_handler->bind_columns(undef, \$id, \$date, \$post);
while($query_handler->fetch()) {
   print "$date, $post <br />";
}
$query_handler->finish();
} else {
while($query_handle->fetch()) {
   print "$date, $post <br />";
}

$query_handle->finish(); $connect->disconnect();
}

print <<"B";

<p>Add entry:
<form action=mysql-10-21.pl method=get>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>Id:</td><td><input type=text size=30 name=f_id></td></tr>
<tr><td>Date:</td><td> <input type=text size=30 name=f_date></td></tr>
<tr><td>Post:</td><td> <textarea type=text rows=3 cols=30 name=f_post></textarea></td></tr>
<tr><td></td><td><input type=submit border=0 value=\"Add\"></td></tr>
</table>
</p>
</form>
</body>
</html>

B

