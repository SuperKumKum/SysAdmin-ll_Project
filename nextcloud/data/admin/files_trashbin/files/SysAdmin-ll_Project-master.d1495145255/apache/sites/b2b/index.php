 <?php
    $username = "wt7";
    $password = "password";
    $hostname = "db"; 
    //connection to the database
    $dbhandle = mysql_connect($hostname, $username, $password) 
    or die("Unable to connect to MySQL");
    echo "Connected to MySQL<br>";
    ?>
