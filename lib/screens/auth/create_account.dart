import 'package:flutter/material.dart';
import 'package:movies_app/firebase/firebase_manager.dart';

// ignore: must_be_immutable
class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});
  static const String routeName = "createAccount";

  //final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static TextEditingController nameController = TextEditingController();

  TextEditingController emaillController = TextEditingController();

  static TextEditingController passwordController = TextEditingController();

  TextEditingController repasswordController = TextEditingController();

  static TextEditingController phoneContrller = TextEditingController();

  String imageUrl = "assets/images/gamer.png";

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            )),
        title: Text(
          "Register",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color(0xffF6BD00), fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    imageUrl,
                    height: 170,
                    width: 170,
                    fit: BoxFit.fill,
                  ),
                ]),
                      const SizedBox(height: 10,),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is Required";
                    }
                    return null;
                  },
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400),
                    hintText: "Name",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    errorStyle: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emaillController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "email is Required";
                    }
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                        .hasMatch(value);
                    if (emailValid == false) {
                      return "email is not valid";
                    }
                    return null;
                  },
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w500),
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
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    errorStyle: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                // third field
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password is Required";
                    }
                    return null;
                  },
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400),
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock_clock_sharp,
                      color: Colors.white,
                    ),
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                      size: 30,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    errorStyle: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //fourth field
                TextFormField(
                  controller: repasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "rePassword is Required";
                    }
                    if (passwordController.text != value) {
                      return "rePassword dosen't match with password";
                    }
                    return null;
                  },
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400),
                    hintText: "rePassword",
                    prefixIcon: const Icon(
                      Icons.lock_clock_sharp,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    errorStyle: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //number field
                TextFormField(
                  controller: phoneContrller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "phone is Required";
                    }
                    return null;
                  },
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400),
                    hintText: "phone Number",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: Color(0xffF6BD00))),
                    errorStyle: const TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // Show the loading dialog immediately
                      final loadingDialog = showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text("Creating account..."),
                          backgroundColor: Colors.transparent,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [CircularProgressIndicator()],
                          ),
                        ),
                      );
                      Navigator.pop(context);

                      FirebaseManager.createAccount(
                        emaillController.text,
                        passwordController.text,
                        nameController.text,
                        phoneContrller.text,
                        imageUrl,
                        // on Loading (not needed, as loading dialog is already shown)
                        () {},
                        // on Success
                        () async {
                          // Close the loading dialog
                          await loadingDialog; // Await before closing to ensure it works correctly
                          Navigator.pop(context);
                          //Navigator.pop(context);
                          // Close the loading dialog
                          // Show success dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Success"),
                              content: Text("Account created successfully!",
                                  style: TextStyle(color: Colors.black)),
                              backgroundColor: const Color(0xffF6BD00),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Close the success dialog
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ),
                          );
                          
                        },
                        // on Error
                        (message) async {
                          // Close the loading dialog
                          await loadingDialog; // Await before closing to ensure it works correctly
                          Navigator.of(context)
                              .pop(); // Close the loading dialog
                          // Show error dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Something went wrong"),
                              content: Text(
                                message,
                                style: TextStyle(color: Colors.black),
                              ),
                              backgroundColor: const Color(0xffF6BD00),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // Close the error dialog
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
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
                    "Create Account",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: const Color(0xff282A28)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ? ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CreateAccount.routeName);
                        },
                        child: Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: const Color(0xffF6BD00)),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
