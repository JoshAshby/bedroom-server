<?php
// Connecting, selecting database
$link = mysql_connect('localhost', 'root', 'speeddyy5')
    or die('Could not connect: ' . mysql_error());
mysql_select_db('php') or die('Could not select database');

// Performing SQL query
$query = 'SELECT * FROM php_db';
$result = mysql_query($query) or die('Query failed: ' . mysql_error());

// Printing results in HTML
echo "<table border=\"1\">\n";
$line = mysql_fetch_array($result, MYSQL_ASSOC);
    echo "\t<tr>\n";
        echo "\t\t<th>#</th>\n";
    foreach (array_keys($line) as $col_value) {
        echo "\t\t<th>$col_value</th>\n";
    }
    echo "\t</tr>\n";
$i=0;
do  {
    echo "\t<tr>\n";
    $i++;
    echo "\t\t<th>$i</th>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}while ($line = mysql_fetch_array($result, MYSQL_ASSOC));
echo "</table>\n";


// Free resultset
mysql_free_result($result);

// Closing connection
mysql_close($link);
?>
