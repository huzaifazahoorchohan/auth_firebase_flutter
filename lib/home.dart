import 'package:auth_firebase/authentication.dart';
import 'package:auth_firebase/signin.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String homeroute = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("WoW Welcome"),
          ElevatedButton(
            onPressed: () => signOutUser().whenComplete(
              () => Navigator.pushReplacementNamed(
                context,
                SignIn.signinroute,
              ),
            ),
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
