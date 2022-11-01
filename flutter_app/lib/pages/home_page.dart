import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/habit_database.dart';
import 'package:table_calendar/table_calendar.dart';
import '../components/habit_tile.dart';
import '../components/new_habit_dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    // there already exists data, this is not the first time
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  void checkboxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value!;
    });
    db.updateDatabase();
  }

  final _newHabitNameController = TextEditingController();

  void createNewHabit() {
    showDialog(
        context: context,
        builder: (context) {
          return newHabitDialogBox(
            hintText: "Enter Habit Name",
            controller: _newHabitNameController,
            onSave: saveNewHabit,
            onCancel: cancelNewHabit,
          );
        });
  }

  void saveNewHabit() {
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void cancelNewHabit() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return newHabitDialogBox(
          hintText: db.todaysHabitList[index][0],
          controller: _newHabitNameController,
          onSave: () => saveExistingHabit(index),
          onCancel: cancelNewHabit,
        );
      },
    );
  }

  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          createNewHabit();
        }),
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: ListView.builder(
          itemCount: db.todaysHabitList.length,
          itemBuilder: (BuildContext context, int index) {
            return HabitTile(
                habitName: db.todaysHabitList[index][0],
                habitCompleted: db.todaysHabitList[index][1],
                onChanged: (value) => {checkboxTapped(value, index)},
                settingsTapped: (context) => openHabitSettings(index),
                deleteTapped: (context) => deleteHabit(index));
          },
        ),
      ),
    );
  }
}
