$years = localtime->year();#another time function, YYMMDD for the "Todays Date"
$year = 1900 + $years;
$day = localtime->mday();
$months = localtime->mon();
$month = 1 + $months;
@f_date = ($year, $month, $day);
$n_date = join("-", @f_date);

print <<"ABC";

<br>
Todays Date (YYMMDD): $n_date <br>
Add entry:
<form action=index.pl method=get>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>Name*:</td><td> <input type=text size=30 name=f_name></td></tr>
<tr><td>Email*:</td><td> <input type=text size=30 name=f_email></td></tr>
<tr><td>Comment*:</td><td> <textarea type=text rows=3 cols=30 name=f_post></textarea></td></tr>
<tr><td></td><td><input type=submit border=0 value=\"Comment\"></td></tr>
</table>
Fields marked with * are required to post a comment.
</form>
</p1>
</div>
<div id="bottom">
<a href="/">Home</a>
<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/us/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/us/80x15.png" /></a>
</div>
</td>
</tr>
</table>
</body>
</html>

ABC

