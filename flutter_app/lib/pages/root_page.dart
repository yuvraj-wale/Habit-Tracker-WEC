import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/constants.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/stats_page.dart';

import 'home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentpage = 0;
  final screens = [
    const HomePage(),
    const StatsPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
          width: 150.0,
          height: 40.0,
          child: Center(
            child: Text('Habit tracker'),
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15)
          ),
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
