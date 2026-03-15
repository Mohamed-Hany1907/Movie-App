import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/firebase/firebase_manager.dart';
import 'package:movies_app/home_screen.dart';
import 'package:movies_app/provider/user_provider.dart';
import 'package:movies_app/screens/auth/create_account.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String routeName = "login";

  TextEditingController emaillController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var userprovider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  "assets/images/splash3x (3).png",
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ]),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: emaillController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is Required";
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                  hintText: "Email",
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password is Required";
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    size: 30,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget password ?",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: const Color(0xffF6BD00)),
                      ))
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseManager.logIn(
                      emaillController.text, passwordController.text, () {
                    showDialog(
                      context: context,
                      builder: (context) => const AlertDialog(
                        title: Center(child: CircularProgressIndicator()),
                        backgroundColor: Colors.transparent,
                      ),
                    );
                  },
                      //on success
                      () {
                    //this line to read user data from firestore and pass it to provider to hold user data to use it in profile
                    // to change the screen and make rebuild to it
                    userprovider.initUser();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (route) => false,
                    );
                  },
                      //on error
                      (message) {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: const Color(0xffF6BD00),
                        title: Text("some thing went error"),
                        content: Text(
                          message,
                          style: TextStyle(color: Colors.black),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"))
                        ],
                      ),
                    );
                  },
                       
                      );
                 // provider.fetchUserData(FirebaseAuth.instance.currentUser!.uid);

                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: const Color(
                        0xffF6BD00), // Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: Text(
                  "Log in",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: const Color(0xff282A28)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t Have Account ?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CreateAccount.routeName);
                      },
                      child: Text(
                        "Create one",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: const Color(0xffF6BD00)),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 1.5, // Set height for thickness
                    color: const Color(0xffF6BD00),
                  ),
                  Text(
                    "  OR  ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: const Color(0xffF6BD00)),
                  ),
                  Container(
                    width: 90,
                    height: 1.5, // Set height for thickness
                    color: const Color(0xffF6BD00),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: const Color(
                        0xffF6BD00), // Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: Text(
                  "Log in with Google",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: const Color(0xff282A28)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
