import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_screen.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/root_page.dart';
import 'package:flutter_application_1/pages/signup_screen.dart';
import 'package:flutter_application_1/pages/stats_page.dart';
import 'package:flutter_application_1/pages/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  ///WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox('habit_database');
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen': (context) => const WelcomeScreen(),
        'signup_screen': (context) => SignUp(),
        'login_screen': (context) => LogIn(),
        'root_page': (context) => const RootPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

/*class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentpage=0;
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
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'home'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'stats'),
          NavigationDestination(icon: Icon(Icons.person), label: 'profile')
        ],
        onDestinationSelected:(int index) {
          setState(() {
            currentpage = index;
          });
        },
        selectedIndex: currentpage,
      ),
    );
  }
}*/

