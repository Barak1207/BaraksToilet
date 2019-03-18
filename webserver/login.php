<?php
   $cookie_name = "BaraksToilet";
   if(isset($_COOKIE[$cookie_name]) && isset($_COOKIE['PHPSESSID']))
   {
      $COOKIE = preg_replace("/[^A-Za-z0-9]/", '', $_COOKIE[$cookie_name]);
      $command = escapeshellcmd('/home/pi/Desktop/web_scripts/can_login.py cookie ' . $COOKIE);
      $output = shell_exec($command);
      if ($output === "True")
      {
         header("Location:home.php");
         die();
      }
   }


?>

<?
   // error_reporting(E_ALL);
   // ini_set("display_errors", 1);
?>

<html lang = "en">
   
   <head>
      <title>Barak's Toilet</title>
     <link href = "style.css" rel = "stylesheet">
   
   </head>
  
   <body id="gardient">
      
      <h1 class="title">Welcome to Barak's Toilet</h1> 
      <div class="imgcontainer">
         <img src="img_avatar2.png" alt="Avatar" class="avatar">
      </div>
      <div class>
         
         <?php
            $msg = '';
            
            if (isset($_POST['login']) && !empty($_POST['username']) && !empty($_POST['password']))
            {

          $USER = preg_replace("/[^A-Za-z0-9_]/", '', $_POST['username']);
               $PW = preg_replace("/[^A-Za-z0-9_]/", '', $_POST['password']);

               $command = escapeshellcmd('/home/pi/Desktop/web_scripts/can_login.py user ' . $USER . " " . $PW);
                $output = shell_exec($command);

               if ($output === "True")
               {
                  /*
                  ini_set('session.cookie_secure','on');
                  ini_set('session.cookie_httponly', 1);
                  ini_set('session.cookie_lifetime', 60*60*24*2);
                  */
                  session_start();
                  $_SESSION['expire_time'] = 60*60*24*2;
                  $_SESSION['username'] = $USER;
                  setcookie($cookie_name, hash('sha256', $USER) . "toilet" . hash('sha256', $PW), time() + 60*60*24*2, '/', NULL, true, true);
                  //echo "\nYou have entered valid user name and password";
                  header('Location:home.php');
                  die();
               }
               else 
               {
                  $msg = 'Wrong username or password';
               }
            }
         ?>
      </div> <!-- /container -->
      
      <div class = "container">
      
         <form class = "form-signin" role = "form" 
            action = "<?php echo htmlspecialchars($_SERVER['PHP_SELF']); 
            ?>" method = "post">
            <h4 class = "form-signin-heading"><?php echo $msg; ?></h4>
            <input class="fields" type = "text" 
               name = "username" placeholder = "Username" 
               required autofocus></br>
            <input class="fields" type = "password"
               name = "password" placeholder = "Password" required>
            <button class = "loginbutton" type = "submit" 
               name = "login">Login</button>
         </form>         
         
      </div> 
      
   </body>
</html>
