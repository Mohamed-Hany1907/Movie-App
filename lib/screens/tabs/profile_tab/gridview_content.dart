import 'package:flutter/material.dart';
import 'package:movies_app/firebase/firebase_manager.dart';
import 'package:movies_app/models/watchListModel.dart';
import 'package:movies_app/my_theme_data.dart';

class GridviewContent extends StatelessWidget {
   GridviewContent({required this.movie, super.key});
   WatchlistModel movie;
  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Image.network(movie.image,
                    width: double.infinity,
                    fit: BoxFit.fill,),
                    Padding(
                      padding: const EdgeInsets.only(top: 8,left: 8),
                      child: Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color:const Color(0xff282A28)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(movie.rating.toString(),style: Theme.of(context).textTheme.bodySmall,),
                            // Image.asset("assets/images/star.png")
                            Icon(Icons.star,color: MyThemeData.commonColor,)
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(onPressed: (){
                        FirebaseManager.deleteMovie(movie.id);
                      }, 
                      icon: const Icon(Icons.delete,color: Colors.red,
                      size: 40,
                      
                      )
                      )
                    )
                  ],
                )
              );
  }
}