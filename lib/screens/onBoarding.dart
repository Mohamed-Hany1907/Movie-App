import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:movies_app/screens/auth/login_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  static const String routeName = "onBoarding";

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // Constants for repeated values
  static const Color primaryColor = Color(0xffF6BD00);
  static const Color backgroundColor = Color(0xff202020);
  static const Color textColor = Colors.white;
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  Widget _buildImageWithText(
      String assetName, BuildContext context, String title, String body) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/$assetName.png',
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          errorBuilder: (context, error, stackTrace) => Center(
            child: Icon(Icons.error, color: Colors.red),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff121312),
              border: Border.all(
                color: Color(0xff121312),
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 19.0,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color(0xff706464),
      ),
      bodyTextStyle: TextStyle(fontSize: 19.0, color: Color(0xffCCCCCC)),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
    );

    return IntroductionScreen(
      globalBackgroundColor: backgroundColor,
      allowImplicitScrolling: false,
      infiniteAutoScroll: false,
      showDoneButton: true,
      onDone: () {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      },
      done: Text(
        'Done',
        style: buttonTextStyle,
      ),
      showNextButton: true,
      next: Text(
        'Next',
        style: buttonTextStyle,
      ),
      showBackButton: true,
      back: Text(
        'Back',
        style: buttonTextStyle,
      ),
      pages: [
        PageViewModel(
          title: "",
          body: "",
          image: _buildImageWithText(
            'Group',
            context,
            "Find Your Next \nFavorite Movie Here",
            "Get access to a huge library of movies to suit all tastes. You will surely like it.",
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImageWithText(
            'frame1',
            context,
            "Discover Movies",
            "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImageWithText(
            'frame2',
            context,
            "Explore All Genres",
            "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImageWithText(
            'frame3',
            context,
            "Create Watchlists",
            "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImageWithText(
            'frame4',
            context,
            "Rate, Review, and Learn",
            "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
          ),
        ),
        PageViewModel(
          title: "",
          body: "",
          image: _buildImageWithText(
            'frame5',
            context,
            'Start Watching Now',
            "Press done To start your journey",
          ),
          decoration: pageDecoration.copyWith(
            fullScreen: true,
          ),
        ),
      ],
    );
  }
}