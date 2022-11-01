import 'package:flutter/material.dart';
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
        title: const Text('Habit Tracker'),
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
