<p>
<html>
<head>
<script type="text/javascript" src="mootools.js"></script>
<script type="text/javascript" src="menu.js"></script>
<script>
var url_before = "Resources/Headers/header";
var url_after = ".jpg";
var min = 1;
var max = 1;
function printRndImg() {
document.write('<img src="' + url_before + ( min + Math.round(Math.random()*(max-min)) ) + url_after + '" boorder="0">')
}
</script>
  <link rel="stylesheet" type="text/css"
 href="Resources/Style.css">
  <meta content="text/html; charset=ISO-8859-1"
 http-equiv="content-type">
  <title>BeagleBarn | Home</title>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="800" align="center">
<TR>
<TD>
<div id="top">
BeagleBarn Private Webserver - By: <a href="http://joshashby.com">joshashby.com</a>
</div>
</TD>
</TR>
</table>
<script>printRndImg();</script><br>
<table cellpadding="0" cellspacing="0" border="0" width="800" align="center"><TR><TD>
<div id="menu">
<a href="/" class="current">Home</a>
<a href="/perl">Perl</a>
<a href="/php">PHP</a>
<a href="/eyeos/browser">eyeOS</a>
<a href="/xampp">XAMPP</a>
<a href="/cgiirc/irc.cgi">IRC</a>
</div>
</TD>
</TR>
</table>
<br>
