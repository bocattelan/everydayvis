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

ini_set('memory_limit', '-1');
set_time_limit(0);                   // ignore php timeout
//ignore_user_abort(true);             // keep on going even if user pulls the plug*
//while(ob_get_level())ob_end_clean(); // remove output buffers
//ob_implicit_flush(true);             // output stuff directly
/*
while (array_push($rows,pg_fetch_assoc($rs))) {
    echo $rows[0]['id_sensor'] . " " . $rows[0]['id_end_device'] . " " . $rows[0]['payload'];
    echo "<br>";
}
*/
echo json_encode(array_values(pg_fetch_all($rs)));
pg_close($con); 

?>
