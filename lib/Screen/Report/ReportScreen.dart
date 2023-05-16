import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minamifuji/Screen/Report/barchartScreen.dart';
import 'package:minamifuji/Screen/Report/grape.dart';
import 'package:minamifuji/Screen/Report/realTime.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.graphic_eq_outlined), text: 'report'),
            Tab(icon: Icon(Icons.pie_chart_outline), text: 'Chart'),
            Tab(icon: Icon(Icons.show_chart_sharp), text: 'grap'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Container(child: GrapScreen(title: 'Grap'))),
          Center(
              child: Container(
            child: BarChartScreen(title: 'Chart'),
          )),
          Center(
            child: Container(
              child: RealTimeScreen(title: 'RealTime'),
            ),
          ),
        ],
      ),
    );
  }
}
