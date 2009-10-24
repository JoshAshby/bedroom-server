#!/usr/bin/perl
################################################
#Project Bouncing Off Bumpers "BOB" Website code
#Joshua Ashby 2009-10-22 (YYMMDD)
#this page, and the css and images will produce
#a dynamic website that will give users the 
#ability to comment on the page, and possibly for
#me, the admin, to post, and change the paragraphs
#that the users can read on bob.
################################################
#these use set up the moduals that perl will use
use DBI;
use DBD::mysql;
use CGI;
use Time::localtime;

$form=new CGI;#starts to set up the form variables for the comments
$f_name=CGI::escapeHTML($form->param("f_name"));
$f_email=CGI::escapeHTML($form->param("f_email"));
$f_post=CGI::escapeHTML($form->param("f_post"));

print "Content-type: text/html \n\n";#tells perl that this is a web page

#MySQL database settings
$platform = "mysql";
$database = "perl";
$host = "localhost";
$port = "3306";
$tablename = "pl_db";
$user = "root";
$pw = "speeddyy5";
$dsn = "dbi:mysql:$database:localhost:3306";

#when called this will connect to the MySQL database
$connect = DBI->connect($dsn, $user, $pw) or die "Couldn't connect to database!" . DBI->errstr;

#sets up the data, and column names that will be used later
$query = "SELECT * FROM $tablename ORDER BY id desc";
$query_handle = $connect->prepare($query);
$query_handle->execute();
$query_handle->bind_columns(undef, \$id, \$date, \$name, \$email, \$post);

print <<"ABC";

<html>
<head>
<link rel="stylesheet" type="text/css" href="Resources/Style.css">
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>Project: Bouncing Off Bumper - BOB | Home</title>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="800px" align="center" height="120">
<tr>
<td>
<img src="./Resources/Header/header1.jpg">
</td>
</tr>
<tr>
<td>
<div id="top">
<ul class="solidblockmenu">
<li><a href="/" class="current"><span>Home</span></a></li>
</ul>
</div>
<div id="content">
<p1>
<h4>Welcome to the Bouncing Off Bumpers project website!</h4>
Please feel free to leave a comment below...<br>

ABC

if($f_name && $f_email) {#if you enter both a name and email
	$queryn = "SELECT MAX(id) FROM $tablename";#connect to the db and get the max id number
	$query_handlen = $connect->prepare($queryn);
	$query_handlen->execute();
	$query_handlen->bind_columns(\$n_id);

	while($query_handlen->fetch()) {#get the max id number and add 1 to it, this will be for the next data entry
		$f_id = $n_id + 1;
	}

	$query_handlen->finish();#finish that query

	$years = localtime->year();#this builds the time stamp for the db, in YYMMDD format
	$year = 1900 + $years;
	$day = localtime->mday();
	$months = localtime->mon();
	$month = 1 + $months;
	@f_date = ($year, $month, $day);
	$n_date = join("-", @f_date);

	$queryw = "INSERT INTO $tablename VALUES ('$f_id', '$n_date', '$f_name', '$f_email', '$f_post')";#connect to the
	$query_handlew = $connect->prepare($queryw);#db and add the new data from the form (below)
	$query_handlew->execute();
	$query_handlew->finish();

	$queryr = "SELECT * FROM $tablename ORDER BY id desc";#re-read the data including the new data and print it out
	$query_handler = $connect->prepare($query);
	$query_handler->execute();
	$query_handler->bind_columns(undef, \$id, \$date, \$name, \$email, \$post);
	while($query_handler->fetch()) {

		print "On $date, $name Said<br> $post <br>";#will print out something like "On 2009-10-22, Joshua Ashby said:"

	}

	$query_handler->finish(); $connect->disconnect();#finish the query and close the connection to the database

} else {#if there is no data in the form
	while($query_handle->fetch()) {#get the data in the database and print it out
		print "On $date, $name Said<br> $post <br>";#prints out like above
	}

}

$query_handle->finish(); $connect->disconnect();#finish the first query and close the database connection

$years = localtime->year();#another time function, YYMMDD for the "Todays Date"
$year = 1900 + $years;
$day = localtime->mday();
$months = localtime->mon();
$month = 1 + $months;
@f_date = ($year, $month, $day);
$n_date = join("-", @f_date);

print <<"ABC"

Todays Date (YYMMDD): $n_date <br>
Add entry:
<form action=mysql-10-21.pl method=get>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>Name:</td><td> <input type=text size=30 name=f_name></td></tr>
<tr><td>Email:</td><td> <input type=text size=30 name=f_email></td></tr>
<tr><td>Comment:</td><td> <textarea type=text rows=3 cols=30 name=f_post></textarea></td></tr>
<tr><td></td><td><input type=submit border=0 value=\"Comment\"></td></tr>
</table>
</p1>
</form>
</div>
<div id="bottom">
<a href="/">Home</a>
</div>
</td>
</tr>
</table>
</body>
</html>

ABC

