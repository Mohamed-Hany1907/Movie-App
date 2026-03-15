import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/my_theme_data.dart';
import 'package:movies_app/home_screen.dart';

import 'package:movies_app/provider/user_provider.dart';

import 'package:movies_app/screens/Film_details.dart';
import 'package:movies_app/screens/auth/create_account.dart';
import 'package:movies_app/screens/auth/login_screen.dart';
import 'package:movies_app/screens/onBoarding.dart';
import 'package:movies_app/screens/web_view_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);

    return MaterialApp(
      theme: MyThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: provider.firebaseUser == null
          ? Onboarding.routeName
          : HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        CreateAccount.routeName: (context) => CreateAccount(),
        HomeScreen.routeName: (context) => HomeScreen(),
        FilmDetails.routeName: (context) => FilmDetails(),
        Onboarding.routeName: (context) => Onboarding(),
      },
    );
  }
}
