AmCharts.ready(function() {
  var chart = new AmCharts.AmSerialChart();
  chart.dataProvider = chartData;
  chart.categoryField = "country"
  var graph = new AmCharts.AmGraph();
  graph.valueField = "visits";
  // graph.type = "column";
  graph.type = "line";
  graph.bullet = "round";
  graph.lineColor = "#8d1cc6";
  chart.addGraph(graph);
  var categoryAxis = chart.categoryAxis;
  categoryAxis.autoGridCount  = false;
  categoryAxis.gridCount = chartData.length;
  categoryAxis.gridPosition = "start";
  categoryAxis.labelRotation = 90;
  graph.fillAlphas = 0;//0.5;
  chart.angle = 30;
  chart.depth3D = 15;
  graph.balloonText = "[[category]]: <b>[[value]]</b>";
  chart.write('chartdiv');
});

