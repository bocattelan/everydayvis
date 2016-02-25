<?php

require_once "conf.php";
require_once "funcoes.php";

function sensorFiler($id_sensor,$payload){
   switch ( $id_sensor ){
       case "2":     
		  if ($payload < 100 && $payload > 1) return true;
		  else return false;
	   break;
	   case "3":
		  if ($payload < 100 && $payload > 0) return true;
		  else return false;	 
	   break;	 
	   default: return true; break;
	 }   
}

//echo "<pre>";print_r($_GET);exit();

//pg_retorna("SELECT * from data", $rQry);

echo "iniciando...<br>";

$sSql = "INSERT INTO data (id_gtw,id_end_device,id_sensor,payload,localizacao,timestamp) 
               VALUES (1,".$_GET["id_end_device"].",".$_GET["id_sensor"].",".$_GET["payload"].",'".($_GET["lat"]." ".$_GET["long"])."',now()::timestamp(0) at time zone 'GMT-3')";

echo $sSql . "<br>";			   

if (sensorFiler($_GET["id_sensor"],$_GET["payload"]))
   $executa = pg_executa($sSql);
else 
   echo "Dados do sensor Filtrados (recusado) <br>";

if ($executa) echo "inserido com sucesso";
			   
?>
