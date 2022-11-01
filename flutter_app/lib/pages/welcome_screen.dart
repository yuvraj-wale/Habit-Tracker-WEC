
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal:8.0,
              vertical: 20.0),
            child: Center(child: Text(
              'Welcome!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              ))),
          ElevatedButton(
            onPressed:() => Navigator.pushNamed(context, 'login_screen'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            child: const Text('Log In')),
            ElevatedButton(
            onPressed:() =>  Navigator.pushNamed(context, 'signup_screen'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            child: const Text('Register'))
          ],
        ),)
    );
  }
}