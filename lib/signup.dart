import 'package:auth_firebase/authentication.dart';
import 'package:auth_firebase/home.dart';
import 'package:auth_firebase/signin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static String signuproute = "/signuproute";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  GlobalKey<FormState> formkeyforemail = GlobalKey<FormState>();
  GlobalKey<FormState> formkeyforpassword = GlobalKey<FormState>();

  // late String email;
  // late String password;

  // void createbtn() {
  //   if (formkeyforemail.currentState!.validate() &&
  //       formkeyforpassword.currentState!.validate()) {
  //     print("Login successfully");
  //     emailcontroller.clear();
  //     passcontroller.clear();
  //   } else {
  //     print("Try again");
  //   }
  //}

  void logintoyouraccount(context) {
    Navigator.pushNamed(context, SignIn.signinroute);
    emailcontroller.clear();
    passcontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Form(
                  key: formkeyforemail,
                  child: TextFormField(
                    autofocus: false,
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      hintText: "Enter your email here",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required your email";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Form(
                  key: formkeyforpassword,
                  child: TextFormField(
                    autofocus: false,
                    controller: passcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter your password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required your password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () =>
                    signUp(emailcontroller.text, passcontroller.text)
                        .whenComplete(
                  () => Navigator.pushReplacementNamed(
                      context, HomeScreen.homeroute),
                ),
                child: const Text("Create"),
              ),
              const SizedBox(
                height: 60.0,
              ),
              TextButton(
                onPressed: () => logintoyouraccount(context),
                child: const Text("Login to your account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
