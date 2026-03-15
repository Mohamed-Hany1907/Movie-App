import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/screens/tabs/home_tab/horizontalListWidget.dart';
import 'package:movies_app/serveces/api_manager.dart';

class MainMoviesList extends StatelessWidget {
  const MainMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
                  future: ApiManager.getMoviesList(),
                   builder: (context, snapshot) {
                     if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                     }
                     else if (snapshot.hasError)
                     {
                        return Center(child: Text("Error"));
                      }
                      else {
                       var data = snapshot.data?.data?.movies ?? [];
                        return SizedBox(
                          height: 350,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Hhorizontallistwidget(
                                movie: data[index],
                                containerHeight: 350,
                                containerWidth: 230,
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: 20,),
                            itemCount: data.length
                          ),
                        );
                     }
                   },
                   );
  }
}