<?php 

$host = "127.0.0.1"; 
$user = "postgres"; 
$port = "5432"; 
$db = "sensordata"; 

$con = pg_connect("host=$host dbname=$db user=$user port=$port")
    or die ("Could not connect to server\n"); 

$query = "SELECT * FROM data"; 

$rs = pg_query($con, $query) or die("Cannot execute query: $query\n");
$rows = array();
while (array_push($rows,pg_fetch_assoc($rs))) {
    echo $rows[0]['id_sensor'] . " " . $rows[0]['id_end_device'] . " " . $rows[0]['payload'];
    echo "<br>";
}

echo json_encode($rows);
pg_close($con); 

?>
