<?php
   $cookie_name = "BaraksToilet";
   if(isset($_COOKIE[$cookie_name]) && isset($_COOKIE['PHPSESSID']))
   {
      $COOKIE = preg_replace("/[^A-Za-z0-9]/", '', $_COOKIE[$cookie_name]);
      $command = escapeshellcmd('/home/pi/Desktop/web_scripts/can_login.py cookie ' . $COOKIE);
      $output = shell_exec($command);
      if ($output === "False")
      {
         header("Location:login.php");
         die();
      }
   }
   else
   {
     header("Location:login.php");
     die();
   }
?>


<!DOCTYPE html>
<html>
<head><link href = "style.css" rel = "stylesheet"></head>
<body style="background-color:Turquoise;">

<?php

$myfile = fopen("/var/log/flushlog", "r") or die("Unable to open file!");
echo '<span style="white-space: pre-line; font-size: 25px; font-weight: bold;">' .  fread($myfile,filesize("/var/log/flushlog")) . '</span';
fclose($myfile);

?>
</body>
</html>
