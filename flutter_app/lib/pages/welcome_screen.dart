
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
          ElevatedButton(
            onPressed:() => Navigator.pushNamed(context, 'login_screen'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent
            ),
            child: const Text('Log In')),
            ElevatedButton(
            onPressed:() =>  Navigator.pushNamed(context, 'signup_screen'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent
            ),
            child: const Text('Register'))
          ],
        ),)
    );
  }
}