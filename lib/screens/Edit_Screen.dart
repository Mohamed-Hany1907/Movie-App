import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_app/firebase/firebase_manager.dart';
import 'package:movies_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import '../my_theme_data.dart';
import 'Text_Profile.dart';
import 'auth/create_account.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  File? _pickedImage;

  Future<void> _pickImageFromGallery() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true, // Adjust layout for keyboard
      appBar: AppBar(
        title: TextProfile(
          text: "Pick Avatar",
          TextSize: 20,
          color: MyThemeData.commonColor,
        ),
      ),
      body: SingleChildScrollView(
        // Make the content scrollable
        padding: const EdgeInsets.all(16), // Add padding to avoid edge sticking
        child: Center(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch children horizontally
            children: [
              // Display the picked image if available
              _pickedImage != null
                  ? GestureDetector(
                      onTap: _pickImageFromGallery,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(_pickedImage!),
                      ),
                    )
                  : GestureDetector(
                      onTap: _pickImageFromGallery,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
              const SizedBox(height: 20),

              // Name Field
              TextFormField(
                controller: nameController,
                //CreateAccount.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is Required";
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                  hintText: "Name",
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xffF6BD00)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: Color(0xffF6BD00)),
                  ),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 15),

              // Password Field
              TextFormField(
                controller: passwordController,
                // CreateAccount.passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is Required";
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
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
                    borderSide: const BorderSide(color: Color(0xffF6BD00)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: Color(0xffF6BD00)),
                  ),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 15),

              // Phone Number Field
              TextFormField(
                controller: repasswordController,
                //CreateAccount.phoneContrller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone is Required";
                  }
                  return null;
                },
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                  hintText: "Phone Number",
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xffF6BD00)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: Color(0xffF6BD00)),
                  ),
                  errorStyle: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 30),

              // Delete Account Button
              ElevatedButton(
                onPressed: () {
                  // Placeholder for delete account logic
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    MyThemeData.RedBottun,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(15),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Text(
                  "Delete Account",
                  style: TextStyle(
                    fontSize: 20,
                    color: MyThemeData.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Update Data Button
              ElevatedButton(
                onPressed: () async {
                  await FirebaseManager.updateUserName(
                      provider.userModel!.id, nameController.text, context);
                    
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    MyThemeData.commonColor,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(15),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Text(
                  "Update Data",
                  style: TextStyle(
                    fontSize: 20,
                    color: MyThemeData.darkColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
