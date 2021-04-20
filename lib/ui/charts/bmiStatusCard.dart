import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BmiStatusCard extends StatefulWidget {
  @override
  _BmiStatusCardState createState() => _BmiStatusCardState();
}

class _BmiStatusCardState extends State<BmiStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Students',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Container(
                height: 200.0,
                width: 170.0,
                child: DonutPieChart.withSampleData()),
            Column(
              children: [
                Container(
                  height: 30.0,
                  width: 170.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.bookmark_rounded,
                      color: Color(0xff93B5C6),
                    ),
                    title: Text(
                      'Underweight',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 10.0),
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 170.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.bookmark_rounded,
                      color: Color(0xff006A4E),
                    ),
                    title: Text(
                      'Normal',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 10.0),
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 170.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.bookmark_rounded,
                      color: Color(0xffD7816A),
                    ),
                    title: Text(
                      'Overweight',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 10.0),
                    ),
                  ),
                ),
                Container(
                  height: 30.0,
                  width: 170.0,
                  child: ListTile(
                    leading: Icon(
                      Icons.bookmark_rounded,
                      color: Color(0xffBD4F6C),
                    ),
                    title: Text(
                      'Obese',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 10.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Donut chart example. This is a simple pie chart with a hole in the middle.

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 20));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(
        0,
        100,
        charts.Color.fromHex(
          code: "#93B5C6",
        ),
      ),
      new LinearSales(
        1,
        75,
        charts.Color.fromHex(
          code: "#006A4E",
        ),
      ),
      new LinearSales(
        2,
        25,
        charts.Color.fromHex(
          code: "#D7816A",
        ),
      ),
      new LinearSales(
        3,
        5,
        charts.Color.fromHex(
          code: "#BD4F6C",
        ),
      ),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        colorFn: (LinearSales sales, _) => sales.color,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final charts.Color color;

  LinearSales(this.year, this.sales, this.color);
}
