<html>
<head>
<link rel="stylesheet" type="text/css" href="Resources/Style.css">
<meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">
<title>BeagleBarn | Perl Playground</title>
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
<li><a href="/"><span>Home</span></a></li>
<li><a href="/perl"><span>Perl</span></a></li>
<li><a href="/php" class="current"><span>PHP</span></a></li>
<li><a href="/eyeos/browser"><span>eyeOS</span></a></li>
<li><a href="/xampp"><span>XAMPP</span></a></li>
<li><a href="/cgiirc/irc.cgi"><span>IRC</span></a></li>
</ul>
</div>
<div id="content">
<h4>Welcome to the BeagleBarn: PHP Playground</h4>
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
<a href="/">Home</a> | <a href="/perl">Perl</a> | <a href="/php">PHP</a> | <a href=" /eyeos/browser">eyeOS</a> | <a href="/xampp">XAMPP</a> | <a href="/cgiirc/irc.cgi">IRC</a>
</div>
</td>
</tr>
</table>
</body>
</html>
