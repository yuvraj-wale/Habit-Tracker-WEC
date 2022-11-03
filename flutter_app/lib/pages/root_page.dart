import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/constants.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/stats_page.dart';
import 'package:intl/intl.dart';

import 'home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentpage = 0;
  DateTime now = DateTime.now();
  String time = DateFormat.jm().format(DateTime.now());
  String day = DateFormat.E().format(DateTime.now());
  String date = DateFormat.d().format(DateTime.now());
  String month = DateFormat.LLL().format(DateTime.now());
  String formattedDate = DateFormat.MMMEd().format(DateTime.now());
  final screens = [
    const HomePage(),
    const StatsPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 125.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 180.0,
                  height: 50.0,
                  child: Center(
                    child: Text('Habit tracker'),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(height: 13.0,),
                Container(
                  width: 90.0,
                  height: 30.0,
                  child: Center(
                    child: Text(time,
                    style: TextStyle(
                      fontSize: 10
                    ),),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ],
            ),
            SizedBox(
              width: 18.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 12.0),
              child: Container(
                width: 90.0,
                height: 110.0,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 13.0),
                  child: Column(
                    children: [Text(day), Text(date), Text(month)],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: currentpage,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'stats'),
          NavigationDestination(icon: Icon(Icons.person), label: 'profile')
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentpage = index;
          });
        },
        selectedIndex: currentpage,
      ),
    );
  }
}
