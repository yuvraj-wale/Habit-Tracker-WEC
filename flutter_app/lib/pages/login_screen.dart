import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Email Address'),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 8.0),
              Text('Email Address'),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final newUser =
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                          Navigator.pushNamed(context, 'root_page');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black),
                  child: const Text('Log In'))
            ],
          ),
        ));
  }
}
