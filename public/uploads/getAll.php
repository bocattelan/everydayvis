<?php 

$host = "127.0.0.1"; 
$user = "postgres"; 
$port = "5432"; 
$db = "sensordata"; 

$con = pg_connect("host=$host dbname=$db user=$user port=$port")
    or die ("Could not connect to server\n"); 

$query = "SELECT * FROM sensors LIMIT 5"; 

$rs = pg_query($con, $query) or die("Cannot execute query: $query\n");

while ($row = pg_fetch_assoc($rs)) {
    echo $row['id_sensor'] . " " . $row['payload'];
    echo "<br>";
}


pg_close($con); 

?>
