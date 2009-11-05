#!/usr/bin/perl
use DBI;
use DBD::mysql;

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

#sets up the data, and column names that will be used later
$query = "SELECT * FROM $tablename ORDER BY id desc";#this is a sql query, it will grab the data from $tablename and order it by id
$query_handle = $connect->prepare($query);#connect to our database, and get ready to send the query
$query_handle->execute();#execute the query
$query_handle->bind_columns(undef, \$id, \$date, \$name, \$email, \$post);#binds the variables to the columns that are returned by the query

while($query_handle->fetch()) {#get the data in the database and print it out
	print "On $date, $name Said<br> $post <br>";#will print out something like "On 2009-10-24, Joshua Ashby said:"
}

$query_handle->finish(); $connect->disconnect();#finish the first query and close the database connection
