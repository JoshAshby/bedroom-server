#!/usr/bin/perl
use DBI;
use DBD::mysql;
use CGI;
use Time::localtime;

$form=new CGI;
$f_name=CGI::escapeHTML($form->param("f_name"));
$f_email=CGI::escapeHTML($form->param("f_email"));
$f_post=CGI::escapeHTML($form->param("f_post"));

print "Content-type: text/html \n\n";

#MySQL database settings
$platform = "mysql";
$database = "databasename";
$host = "localhost";
$port = "3306";
$tablename = "tablename";
$user = "user";
$pw = "password";
$dsn = "dbi:$platform:$database:$host:$port";

$connect = DBI->connect($dsn, $user, $pw) or die "Couldn't connect to database!" . DBI->errstr;

$query = "SELECT * FROM $tablename ORDER BY id desc";#get the data and bind the columns to variables 
$query_handle = $connect->prepare($query);
$query_handle->execute();
$query_handle->bind_columns(undef, \$id, \$date, \$name, \$email, \$post);

print <<"A";#prints out until "A"

<html>
<head>
  <meta content="text/html; charset=ISO-8859-1"
 http-equiv="content-type">
  <title>Perl and MySQL Comments</title>
</head>
<body>
Comments:<br>

A

if($f_name && $f_email) {#if there is a name and email entered do this

$queryn = "SELECT MAX(id) FROM $tablename";#get the max id number from the database and bind the column to $n_id
$query_handlen = $connect->prepare($queryn);
$query_handlen->execute();
$query_handlen->bind_columns(\$n_id);

while($query_handlen->fetch()) {
$f_id = $n_id + 1;#get the highest id number, and add 1 to it
}

$query_handlen->finish();

#generate a date stamp
$years = localtime->year();
$year = 1900 + $years;
$day = localtime->mday();
$months = localtime->mon();
$month = 1 + $months;
@f_date = ($year, $month, $day);
$n_date = join("-", @f_date);

$queryw = "INSERT INTO $tablename VALUES ('$f_id', '$n_date', '$f_name', '$f_email', '$f_post')";#insert our data into the database
$query_handlew = $connect->prepare($queryw);
$query_handlew->execute();
$query_handlew->finish();

$queryr = "SELECT * FROM $tablename ORDER BY id desc";#get all the data and bind the columns to variables
$query_handler = $connect->prepare($query);
$query_handler->execute();
$query_handler->bind_columns(undef, \$id, \$date, \$name, \$email, \$post);

while($query_handler->fetch()) {
print "$date .::. $name <br> $post <br>";#retrieve each line of data, and print it out
}

$query_handler->finish(); $connect->disconnect();#finish and disconnect from the database

} else {#if there is no use data, do this

while($query_handle->fetch()) {
print "$date .::. $name <br> $post <br>";#retrieve each line of data, and print it out
}

}

$query_handle->finish(); $connect->disconnect();#finishes the query, and closes the connection with the database

#generates the date stamp
$years = localtime->year();
$year = 1900 + $years;
$day = localtime->mday();
$months = localtime->mon();
$month = 1 + $months;
@f_date = ($year, $month, $day);
$n_date = join("-", @f_date);

print <<"B";

<p>Todays Date (YYMMDD): $n_date <br>
Add entry:
<form action=mysql-10-21.pl method=get>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>Name:</td><td> <input type=text size=30 name=f_name></td></tr>
<tr><td>Email:</td><td> <input type=text size=30 name=f_email></td></tr>
<tr><td>Comment:</td><td> <textarea type=text rows=3 cols=30 name=f_post></textarea></td></tr>
<tr><td></td><td><input type=submit border=0 value=\"Comment\"></td></tr>
</table>
</p>
</form>
</body>
</html>

B

