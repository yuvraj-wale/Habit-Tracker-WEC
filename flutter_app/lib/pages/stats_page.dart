import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/month_summary.dart';
import 'package:flutter_application_1/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: [
          MonthlySummary(datasets: db.heatMapDataSet, startDate: "20221005")///_myBox.get('START_DATE'))
        ],// above "20221005" is used as an example for showcasing
      ),
    );
  }
}