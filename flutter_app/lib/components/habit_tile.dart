import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;

  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      this.onChanged,
      this.settingsTapped,
      this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: settingsTapped,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(12.0),
          ),
          SlidableAction(
            onPressed: deleteTapped,
            backgroundColor: Colors.red.shade800,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12.0),
          )
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 10.0
            ),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            children: [
              Checkbox(value: habitCompleted, onChanged: onChanged),
              Text(habitName),
            ],
          ),
        ),
      ),
    );
  }
}
