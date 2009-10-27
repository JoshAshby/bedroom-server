#!/usr/bin/perl
use DBI;
use DBD::mysql;
use Time::localtime;

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

#when called this will connect to the MySQL database
$connect = DBI->connect($dsn, $user, $pw) or die "Couldn't connect to database!" . DBI->errstr;

#set up your variables here:
$f_name = "bob";
$f_email = "bob\@example.com";
$f_post = "this is a test comment";

$years = localtime->year();#this builds the time stamp for the db, in YYMMDD format
$year = 1900 + $years;
$day = localtime->mday();
$months = localtime->mon();
$month = 1 + $months;
@f_date = ($year, $month, $day);
$n_date = join("-", @f_date);

$queryn = "SELECT MAX(id) FROM $tablename";#connect to the db and get the max id number
$query_handlen = $connect->prepare($queryn);
$query_handlen->execute();
$query_handlen->bind_columns(\$n_id);
while($query_handlen->fetch()) {#get the max id number and add 1 to it, this will be for the next data entry
	$f_id = $n_id + 1;
}

#sets up the data that we'll write to the database
$queryw = "INSERT INTO $tablename VALUES ('$f_id', '$n_date', '$f_name', '$f_email', '$f_post')";#this is a sql query, it will store the data we give it in the database
$query_handlew = $connect->prepare($queryw);#connect to our database, and get ready to send the query
$query_handlew->execute();#execute the query
$query_handlew->finish();#finish the query

#sets up the data, and column names that will be used later
$query = "SELECT * FROM $tablename ORDER BY id desc";#this is a sql query, it will grab the data from $tablename and order it by id
$query_handle = $connect->prepare($query);#connect to our database, and get ready to send the query
$query_handle->execute();#execute the query
$query_handle->bind_columns(undef, \$id, \$date, \$name, \$email, \$post);#binds the variables to the columns that are returned by the query

while($query_handle->fetch()) {#get the data in the database and print it out
	print "On $date, $name Said<br> $post <br>";#will print out something like "On 2009-10-24, Joshua Ashby said:"
}

$query_handle->finish(); $connect->disconnect();#finish the first query and close the database connection
