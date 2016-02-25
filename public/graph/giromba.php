<?php

require_once "conf.php";
require_once "funcoes.php";

$_GET["tipo"] = "end_device";
$_GET["id_end_device"] = "666";
if (!$_GET["periodo"]) $_GET["periodo"] = 24;

  pg_retorna("SELECT *,
                                 to_char(timestamp, 'DD-MM-YY HH24:MI:SS') as timestamp_ajustado
								 FROM data WHERE 1 = 1      
                                              AND id_sensor = 2										
											  ORDER BY timestamp DESC LIMIT 1", $rQryDataTemperatura);
											  
  pg_retorna("SELECT *,
                                 to_char(timestamp, 'DD-MM-YY HH24:MI:SS') as timestamp_ajustado
								 FROM data WHERE 1 = 1      
                                              AND id_sensor = 3										
											  ORDER BY timestamp DESC LIMIT 1", $rQryDataUmidade);
											  
?>

<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
    
    // Load the Visualization API and the piechart package.
    google.load('visualization', '1', {'packages':['corechart']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);
      
    function drawChart() {
      var jsonData1 = $.ajax({
          url: "getData.php?tipo=<?php echo $_GET["tipo"]; ?>&id_end_device=<?php echo $_GET["id_end_device"]; ?>&id_sensor=2&periodo=<?php echo $_GET["periodo"]; ?>",
          dataType:"json",
          async: false
          }).responseText;
		  
      var jsonData2 = $.ajax({
          url: "getData.php?tipo=<?php echo $_GET["tipo"]; ?>&id_end_device=<?php echo $_GET["id_end_device"]; ?>&id_sensor=3&periodo=<?php echo $_GET["periodo"]; ?>",
          dataType:"json",
          async: false
          }).responseText;		  
		  
        var options1 = {
          title: 'ID End Device  - <?php echo $_GET["id_end_device"]; ?> - ID Sensor 2 (temp) - Periodo <?php echo $_GET["periodo"]; ?> hora(s) - Timezone Brasil - Ultima leitura <?php echo $rQryDataTemperatura[0]["timestamp_ajustado"]; ?> - Payload <?php echo $rQryDataTemperatura[0]["payload"]; ?> ',
          legend: { position: 'bottom' },
		  width: 1300,
		  height: 400
        };
		
        var options2 = {
          title: 'ID End Device  - <?php echo $_GET["id_end_device"]; ?> - ID Sensor 3 (umidade) - Periodo <?php echo $_GET["periodo"]; ?> hora(s) - Timezone Brasil - Ultima leitura <?php echo $rQryDataUmidade[0]["timestamp_ajustado"]; ?> - Payload <?php echo $rQryDataUmidade[0]["payload"]; ?>',
          legend: { position: 'bottom' },
		  width: 1300,
		  height: 400
        };		
		  
          
      // Create our data table out of JSON data loaded from server.
      var data1 = new google.visualization.DataTable(jsonData1);
	  var data2 = new google.visualization.DataTable(jsonData2);

      // Instantiate and draw our chart, passing in some options.  
	  var chart1 = new google.visualization.LineChart(document.getElementById('chart_div1'));
	  var chart2 = new google.visualization.LineChart(document.getElementById('chart_div2'));

	  
      chart1.draw(data1, options1);
	  chart2.draw(data2, options2);
    }

    </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div1"></div>
    <div id="chart_div2"></div>	
  </body>
</html> 