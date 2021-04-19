import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;

  DashboardCard({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(
            title ?? 'Students',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          subtitle: Text(
            value ?? '2.5 K',
            style:
                Theme.of(context).textTheme.headline1.copyWith(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
