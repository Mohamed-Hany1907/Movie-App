import 'package:flutter/material.dart';
import 'package:movies_app/screens/tabs/home_tab/horizontalListWidget.dart';
import 'package:movies_app/serveces/api_manager.dart';

class SuggestedMoviesList extends StatelessWidget {
  const SuggestedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
                  future: ApiManager.getSuggestions(),
                   builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator());
                      }
                      else if (snapshot.hasError)
                      {
                          return Center(child: Text("Error"));
                        }
                        else {
                        var sugesstedData = snapshot.data?.data?.movies ?? [];
                          return SizedBox(
                            height: 180,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Hhorizontallistwidget(
                                  movie: sugesstedData[index],
                                  containerHeight: 220,
                                  containerWidth: 120,
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(width: 20,),
                              itemCount: sugesstedData.length
                            ),
                          );
                      }
                    },
                    );
  }
}