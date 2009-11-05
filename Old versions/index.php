<? include("header.php"); ?>
<table cellpadding="0" cellspacing="0" border="0" width="800" align="center">
<tr>
<td>
<div id="content">
Welcome to the BeagleBarn Private Development Web Server. This server does have FTP turned on with user "nobody" and password "joshua"<br>
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
</td>
</tr>
</table>
<? include("footer.php"); ?>
