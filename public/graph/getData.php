
<?php 
require_once "conf.php";
require_once "funcoes.php";

if ($_GET["tipo"] == "end_device"){
  if ($_GET["id_end_device"]) $end_device_sql = "AND id_end_device = ".$_GET["id_end_device"]."";
  if ($_GET["periodo"]>24) $timestamp_sql = "to_char(timestamp, 'DD-MM-YY HH24:MI') as timestamp_ajustado";
  else $timestamp_sql = "to_char(timestamp, 'HH24:MI') as timestamp_ajustado";
  $iQryData = pg_retorna("SELECT *,
                                 ".$timestamp_sql."
								 FROM data WHERE 1 = 1 
                                               ".$end_device_sql."
                                              AND id_sensor = ".$_GET["id_sensor"]."  										
											  AND timestamp > (now()::timestamp(0) at time zone 'GMT-2' - INTERVAL '".$_GET["periodo"]." HOUR') ORDER BY timestamp ASC", $rQryData);
} 

    $array = array();

    $array['cols'][] = array('type' => 'string');
    $array['cols'][] = array('type' => 'number');

    //HERE you have the difference
	for ($i = 0; $i < $iQryData; $i++){
	  if ($rQryData[$i]["payload"]>0){
        $array['rows'][]['c'] = array(
            array('v' => $rQryData[$i]["timestamp_ajustado"]),
            array('v' => $rQryData[$i]["payload"])
        );
	  }
	}

    echo json_encode($array);


?> 
