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
<body id="gardient">
<audio id="audio" preload="auto" src="flush.mp3"></audio>
<?php session_start() ?>

<div>
<h1 class="title">Hello <?php echo $_SESSION['username']?>!</h1>
</div>
<!--<h1>Flush Me!</h1> !-->


<div><p class="output" id="output"></p></div>

<div style="text-align:center;">
<button class="flushbutton" onclick="httpGetFlush()"><span>Flush!</span></button>
</div>

<div><a href = "snap.php" title = "view_log">See toilet</a></div>
<div><a href = "flushlog.php" title = "view_log">View log</a></div>
<div><a href = "logout.php" title = "logout">Logout</a></div>
<script>
function httpGetFlush()
{
    document.getElementById("output").innerHTML = "";
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", "/flush.php", false ); // false for synchronous request
    xmlHttp.send( null );
    //return xmlHttp.responseText;
    if(xmlHttp.responseText.trim() === "True")
    {
        play();
        document.getElementById("output").innerHTML = "";
    }
    else
    {
         document.getElementById("output").innerHTML = "Failed to flush!";
    }
}
function play()
{
   var audio = document.getElementById("audio");
   audio.play();
}
</script>

</body>
</html>
