// PHP Image Rotator
// simply drop this PHP into a folder of images
// and call it with a little HTML
// Usage: <img src="PATH/TO/rotator.php" alt="" title="" />

$img_folder = '';
$extensions = 'jpg|jpeg|png|gif';
$extensions = explode('|', $extensions);
$files = array(); 
if($img_folder == '') {
  $img_folder = './';
}
$handle = opendir($img_folder);
while(false !== ($file = readdir($handle))) {
  foreach($extensions as $extension) {
    if(preg_match("/\." . $extension . "$/x", $file)) {
      $files[] = $file;
      $x++;
    }
  }
}
// Close the directory handle
closedir($handle);
if(phpversion() < "4.2") {
  mt_srand((double)microtime()*100000);
}
print $img_folder . $files[mt_rand(0, $x-1)];
