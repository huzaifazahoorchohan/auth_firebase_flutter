import 'package:auth_firebase/authentication.dart';
import 'package:auth_firebase/home.dart';
import 'package:auth_firebase/signup.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static String signinroute = "/";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  GlobalKey<FormState> formkeyforemail = GlobalKey<FormState>();
  GlobalKey<FormState> formkeyforpassword = GlobalKey<FormState>();

  // late String email;
  // late String password;

  // void loginbtnclicked() {
  //   if (formkeyforemail.currentState!.validate() &&
  //       formkeyforpassword.currentState!.validate()) {
  //     print("Login successfully");
  //     emailcontroller.clear();
  //     passcontroller.clear();
  //   } else {
  //     print("Try again");
  //   }
  // }

  void signupbtnclicked(context) {
    Navigator.pushNamed(context, SignUp.signuproute);
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
                "Login your account",
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
                    signIn(emailcontroller.text, passcontroller.text)
                        .whenComplete(
                  () => Navigator.pushReplacementNamed(
                      context, HomeScreen.homeroute),
                ),
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 60.0,
              ),
              TextButton(
                onPressed: () => signupbtnclicked(context),
                child: const Text("Create your account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
