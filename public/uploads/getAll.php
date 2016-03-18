<?php

require_once "../sensors/conf.php";
require_once "../sensors/funcoes.php";


//echo "<pre>";print_r($_GET);exit();

//pg_retorna("SELECT * from data", $rQry);

echo "iniciando...<br>";

$sSql = "SELECT * FROM data";

echo $sSql . "<br>";			   


$executa = pg_executa($sSql);


echo $executa . "<br>";
			   
?>
