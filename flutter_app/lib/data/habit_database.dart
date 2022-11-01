import 'package:hive_flutter/hive_flutter.dart';

import '../dateTime/date_time.dart';

final _myBox = Hive.box('habit_database');

class HabitDatabase {
  List todaysHabitList = [];
  Map<DateTime, int> heatMapDataSet = {
    //followinf are exampmle datasets for showcasing otherwise should be left empty
    DateTime(2022, 10, 02): 3,
    DateTime(2022, 10, 03): 7,
    DateTime(2022, 10, 04): 1,
    DateTime(2022, 10, 05): 6,
    DateTime(2022, 10, 06): 9,
    DateTime(2022, 10, 07): 2,
    DateTime(2022, 10, 08): 3,
    DateTime(2022, 10, 09): 4,
    DateTime(2022, 10, 10): 2,
    DateTime(2022, 10, 11): 7,
    DateTime(2022, 10, 12): 9,
    DateTime(2022, 10, 13): 3,
    DateTime(2022, 10, 14): 6,
    DateTime(2022, 10, 15): 1,
    DateTime(2022, 10, 16): 8,
    DateTime(2022, 10, 17): 3,
    DateTime(2022, 10, 18): 5,
    DateTime(2022, 10, 19): 7,
    DateTime(2022, 10, 20): 6,
    DateTime(2022, 10, 21): 5,
    DateTime(2022, 10, 22): 3,
    DateTime(2022, 10, 23): 8,
    DateTime(2022, 10, 24): 9,
    DateTime(2022, 10, 25): 1,
    DateTime(2022, 10, 26): 4,
    DateTime(2022, 10, 27): 6,
    DateTime(2022, 10, 28): 7,
    DateTime(2022, 10, 29): 4,
    DateTime(2022, 10, 30): 2,
    DateTime(2022, 10, 31): 8,
    DateTime(2022, 10, 1): 6,
  };

  void createDefaultData() {
    todaysHabitList = [
      ['Run', false],
      ['read', false]
    ];
     _myBox.put("START_DATE", todaysDateFormatted());
  }
  

  // load data if it already exists
  void loadData() {
    // if it's a new day, get habit list from database
    if (_myBox.get(todaysDateFormatted()) == null) {
      todaysHabitList = _myBox.get("CURRENT_HABIT_LIST");
      // set all habit completed to false since it's a new day
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    }
    // if it's not a new day, load todays list
    else {
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }


  // update database
  void updateDatabase() {
    // update todays entry
    _myBox.put(todaysDateFormatted(), todaysHabitList);

    // update universal habit list in case it changed (new habit, edit habit, delete habit)
    _myBox.put("CURRENT_HABIT_LIST", todaysHabitList);

    // calculate habit complete percentages for each day
    calculateHabitPercentages();

    // load heat map
    loadHeatMap();
  }
   void calculateHabitPercentages() {
    int countCompleted = 0;
    for (int i = 0; i < todaysHabitList.length; i++) {
      if (todaysHabitList[i][1] == true) {
        countCompleted++;
      }
    }

    String percent = todaysHabitList.isEmpty
        ? '0.0'
        : (countCompleted / todaysHabitList.length).toStringAsFixed(1);

    // key: "PERCENTAGE_SUMMARY_yyyymmdd"
    // value: string of 1dp number between 0.0-1.0 inclusive
    _myBox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(_myBox.get("START_DATE"));

    // count the number of days to load
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // go from start date to today and add each percentage to the dataset
    // "PERCENTAGE_SUMMARY_yyyymmdd" will be the key in the database
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercent = double.parse(
        _myBox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
      );

      // split the datetime up like below so it doesn't worry about hours/mins/secs etc.

      // year
      int year = startDate.add(Duration(days: i)).year;

      // month
      int month = startDate.add(Duration(days: i)).month;

      // day
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}

