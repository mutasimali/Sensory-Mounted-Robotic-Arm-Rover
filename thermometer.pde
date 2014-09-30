void thermometer(){
  image(thermob,464,95);
  thermo=ck;
  humidity="Humidity "+hk+"%";
  DefaultValueDataset dataset = new DefaultValueDataset(thermo);
  ThermometerPlot plot = new ThermometerPlot(dataset);
  JFreeChart chart = new JFreeChart(humidity,JFreeChart.DEFAULT_TITLE_FONT, plot, false);
  plot.setBackgroundPaint(Color.decode("#eeeeee"));
  plot.setOutlinePaint(Color.decode("#eeeeee"));
  plot.setValuePaint(Color.decode("#000000"));
  plot.setRange(-40,80);
  thermometer = new PImage(chart.createBufferedImage(120,370));
  image(thermometer, 479, 105);
}
