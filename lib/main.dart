import 'package:auth_firebase/home.dart';
import 'package:auth_firebase/signin.dart';
import 'package:auth_firebase/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Firebase Auth",
            initialRoute: SignUp.signuproute,
            routes: {
              SignIn.signinroute: (context) => const SignIn(),
              SignUp.signuproute: (context) => const SignUp(),
              HomeScreen.homeroute: (context) => const HomeScreen(),
            },
          );
        });
  }
}

//     return FutureBuilder(
//       future: _initialization,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text("Something wrong with firebase");
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           return const MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: "Todo app with firebase",
//             home: HomeScreen(),
//           );
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }