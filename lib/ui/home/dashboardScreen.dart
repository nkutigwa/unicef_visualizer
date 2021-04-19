import 'package:flutter/material.dart';
import 'package:flutter_login_screen/ui/charts/ageGroupCard.dart';
import 'package:flutter_login_screen/ui/charts/bmiStatusCard.dart';
import 'package:flutter_login_screen/ui/charts/dashboardCard.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Color(0xffFEBB00),
          onPressed: () {
            //Go to Add Student Screen
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DashboardCard(
                          title: 'Students',
                          value: '205k',
                        ),
                        DashboardCard(
                          title: 'Underweight',
                          value: '100k',
                        ),
                        DashboardCard(
                          title: 'Normal',
                          value: '75k',
                        ),
                        DashboardCard(
                          title: 'Overweight',
                          value: '25k',
                        ),
                        DashboardCard(
                          title: 'Obese',
                          value: '5k',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
//                        Flexible(child: AgeGroupCard()),
                        BmiStatusCard(),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 4.0, right: 4.0, top: 4.0),
                  child: AgeGroupCard())
            ],
          ),
        ),
      ),
    );
  }
}
