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
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          MonthlySummary(datasets: db.heatMapDataSet, startDate: "20221005"),///_myBox.get('START_DATE'))
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60.0,
              vertical: 0.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal:20.0,
                vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: 
              Center(
                child: Text(
                  'Daily-Tracker Heatmap',
                  style:
                   TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                  ),
              ),
            ),
          ),
        ],// above "20221005" is used as an example for showcasing
      ),
    );
  }
}