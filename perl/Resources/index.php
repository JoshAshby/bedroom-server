<html>
<head>
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
  <title>BeagleBarn | Perl Playground</title>
</head>
<body>
<p>
<table border="0" cellpadding="0" cellspacing="0" width="800" align="center">
<TR>
<TD>
<div id="top">
BeagleBarn Private Webserver - By: <a href="http://joshashby.com">joshashby.com</a>
</div>
<script>printRndImg();</script><br>
<ul class="solidblockmenu">
<li><a href="/"><span>Home</span></a></li>
<li><a href="/perl" class="current"><span>Perl</span></a></li>
<li><a href="/php"><span>PHP</span></a></li>
<li><a href="/eyeos/browser"><span>eyeOS</span></a></li>
<li><a href="/xampp"><span>XAMPP</span></a></li>
<li><a href="/cgiirc/irc.cgi"><span>IRC</span></a></li>
</ul>
</div>
<div id="content">
<h4>Welcome to the BeagleBarn: Perl Playground</h4>
Files in this folder:<br>
<?php
if ($handle = opendir('.')) {
    while (false !== ($file = readdir($handle))) {
        if ($file != "." && $file != ".." && $file != "header.php" && $file != "footer.php" && $file != "index.php" && $file != "Resources" && $file != "favicon.ico") {
            echo '<a href="'.$file.'">'.$file.'</a><br>';
        }
    }
    closedir($handle);
}
?>
</div>
<div id="bottom">
<a href="/eyeos/browser">EyeOS</a> | <a href="/xampp">XAMPP</a> | <a href="/cgiirc/irc.cgi">BeagleBarn Local IRC</a>
<br>
<a href="mailto:joshuaashby@joshashby.com">2009 Josh Ashby - joshashby.com</a>
</div>
</TD>
</TR>
</table>
</p>
</body>
</html>
