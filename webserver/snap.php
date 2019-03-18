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
//echo $_SESSION['username'];
?>

<?php
session_start();
//echo "Thank you for wasting electricity!";
$USER = preg_replace("/[^A-Za-z0-9_]/", '', $_SESSION['username']);
$client_ip = $_SERVER['REMOTE_ADDR'];
if (filter_var($client_ip, FILTER_VALIDATE_IP) && !empty($USER))
{
      $command = escapeshellcmd('sudo /home/pi/Desktop/web_scripts/snap.py & > /dev/null');
      $output = shell_exec($command);
}

?>

<!DOCTYPE html>
<html>
<body>

<img src="toilet.jpg">

</body>
</html>


