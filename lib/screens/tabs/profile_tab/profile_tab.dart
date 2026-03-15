import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/firebase/firebase_manager.dart';
import 'package:movies_app/models/watchListModel.dart';
import 'package:movies_app/provider/user_provider.dart';
import 'package:movies_app/screens/auth/login_screen.dart';
import 'package:movies_app/screens/Text_Profile.dart';
import 'package:movies_app/screens/tabs/profile_tab/gridview_content.dart';
import 'package:provider/provider.dart';

import '../../../my_theme_data.dart';
import '../../Edit_Screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int gridLength = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var provider = Provider.of<UserProvider>(context);

    // Handle null userModel
    if (provider.userModel == null) {
      return Center(child: Text('No user data available'));
    }

    return Scaffold(
      backgroundColor: MyThemeData.darkColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Container(
              width: double.infinity,
              height: height * 0.44, // Adjust height as needed
              decoration: BoxDecoration(
                color: Color(0xff212121),
              ),
              child: Column(
                children: [
                  SizedBox(height: height * 0.09),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: [
                            // Profile Picture
                            Container(
                              width: 120,
                              height: 118,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(provider.userModel!.imagePath),
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            // User Name
                            TextProfile(
                              text: provider.userModel!.name,
                              TextSize: 20,
                              color: MyThemeData.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: width * 0.01),
                      // Wishlist and History Counts
                      Row(
                        children: [
                          _buildCountColumn(gridLength.toString(), "Wish List"),
                          SizedBox(width: width * 0.06),
                          _buildCountColumn("0", "History"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Edit Profile Button
                      ElevatedButton(
                        onPressed: () {
                          // Use Navigator.push instead of pushReplacement
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: MyThemeData.commonColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.1, vertical: 15),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        child: TextProfile(
                          text: ("Edit Profile"),
                          TextSize: 20,
                          color: MyThemeData.darkColor,
                        ),
                      ),
                      // Exit Button
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await FirebaseManager().signOut();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Failed to log out. Please try again."),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextProfile(
                              text: ("Exit"),
                              TextSize: 20,
                              color: MyThemeData.primaryColor,
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.output_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child:
                      Text("my watch list",style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MyThemeData.commonColor
                      ),
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Additional Content Section

            SizedBox(
              height: 400,
              child: StreamBuilder<QuerySnapshot<WatchlistModel>>(
                stream: FirebaseManager.getMovies(),
                builder: (context, snapshot) {
                    if (snapshot.hasData) {
            final dataLength = snapshot.data!.docs.length;

            // Update the state only if the length changes
            if (gridLength != dataLength) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  gridLength = dataLength;
                });
              });
            }
          }

          return (gridLength == 0)
                    ? Container(
                      
              width: width,
              height: height * 0.4,
              child: Center(
                child: Image.asset(
                  "assets/images/img_4.png",
                  width: 125,
                  height: 125,
                ),
              ),
            )
           
                    : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                    childAspectRatio: 0.8,
                     // Aspect ratio of grid items
                  ),
                  itemCount: snapshot.data?.docs.length ?? 0, // Number of items in grid
                  itemBuilder: (context, index) {
                    
                    return GridviewContent(
                      movie: snapshot.data!.docs[index].data(),
                    );
                  
                  }
                    );
                },
             
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Widget for Wishlist/History Counts
  Widget _buildCountColumn(String count, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextProfile(
          text: count,
          TextSize: 30,
          color: MyThemeData.primaryColor,
        ),
        SizedBox(height: 10),
        TextProfile(
          text: label,
          TextSize: 26,
          color: MyThemeData.primaryColor,
        ),
      ],
    );
  }
}
