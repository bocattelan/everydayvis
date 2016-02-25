<?php

require_once "conf.php";
require_once "funcoes.php";


  pg_retorna("SELECT *,
                                 to_char(timestamp, 'DD/MM/YY HH24:MI:SS') as timestamp_ajustado
								 FROM data WHERE 1 = 1      
                                              AND id_sensor = ".$_GET["id_sensor"]."										
											  AND id_end_device = ".$_GET["id_end_device"]."
											  ORDER BY timestamp DESC LIMIT 1", $rQryDataUlt);
											  

											  
?>


<html>
  <head>
    <meta http-equiv="refresh" content="7" > 
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript">
    
    // Load the Visualization API and the piechart package.
    google.load('visualization', '1', {'packages':['corechart']});
      
    // Set a callback to run when the Google Visualization API is loaded.
    google.setOnLoadCallback(drawChart);
      
    function drawChart() {
      var jsonData = $.ajax({
          url: "getData.php?tipo=<?php echo $_GET["tipo"]; ?>&id_end_device=<?php echo $_GET["id_end_device"]; ?>&id_sensor=<?php echo $_GET["id_sensor"]; ?>&periodo=<?php echo $_GET["periodo"]; ?>",
          dataType:"json",
          async: false
          }).responseText;
		  
        var options = {
          title: 'ID End Device  - <?php echo $_GET["id_end_device"]; ?> - Monoxido de Carbono (CO) - Periodo <?php echo $_GET["periodo"]; ?> hora(s) - Ultima Leitura <?php echo $rQryDataUlt[0]["timestamp_ajustado"]; ?> - Leitura <?php echo $rQryDataUlt[0]["payload"]; ?>',
          legend: { position: 'bottom' },
		  width: 1300,
		  height: 400
        };
		  
          
      // Create our data table out of JSON data loaded from server.
      var data = new google.visualization.DataTable(jsonData);

      // Instantiate and draw our chart, passing in some options.  
	  var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

	  
      chart.draw(data, options);
    }

    </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
	<div ="chart_div"></div>
    <div id="chart_div"></div>
  </body>
</html> 