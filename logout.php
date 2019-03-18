<?php

   setcookie("BaraksToilet","",time()-1);

   setcookie("PHPSESSID","",time()-1);
   session_start();
   session_unset();
   session_destroy();
   //header('Refresh: 1; URL = login.php');
   header("Location:login.php");
   die();

?>
