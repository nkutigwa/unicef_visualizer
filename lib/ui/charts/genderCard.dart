import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GenderCard extends StatefulWidget {
  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Card(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            bottom: 32.0,
          ),
          child: ListTile(
              title: Text(
                'Gender',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: StackedHorizontalBarChart.withSampleData()),
        ),
      )),
    );
  }
}

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedHorizontalBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedHorizontalBarChart.withSampleData() {
    return new StackedHorizontalBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final underweight = [
      new OrdinalSales(
        'Male',
        100,
        charts.Color.fromHex(
          code: "#93B5C6",
        ),
      ),
      new OrdinalSales(
        'Female',
        25,
        charts.Color.fromHex(
          code: "#93B5C6",
        ),
      ),
    ];

    final normal = [
      new OrdinalSales(
        'Male',
        170,
        charts.Color.fromHex(
          code: "#006A4E",
        ),
      ),
      new OrdinalSales(
        'Female',
        75,
        charts.Color.fromHex(
          code: "#006A4E",
        ),
      ),
    ];

    final overweight = [
      new OrdinalSales(
        'Male',
        10,
        charts.Color.fromHex(
          code: "#D7816A",
        ),
      ),
      new OrdinalSales(
        'Female',
        150,
        charts.Color.fromHex(
          code: "#D7816A",
        ),
      ),
    ];
    final obese = [
      new OrdinalSales(
        'Male',
        20,
        charts.Color.fromHex(
          code: "#BD4F6C",
        ),
      ),
      new OrdinalSales(
        'Female',
        55,
        charts.Color.fromHex(
          code: "#BD4F6C",
        ),
      ),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Obese',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: obese,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Overweight',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: overweight,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Normal',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: normal,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Underweight',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) => sales.color,
        data: underweight,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;
  final charts.Color color;
  OrdinalSales(this.year, this.sales, this.color);
}
