import 'package:flutter/cupertino.dart';
import 'package:movies_app/models/cast_model.dart';

import '../my_theme_data.dart';

class CastWidget extends StatelessWidget {
  final CastModel cast;
   CastWidget({required this.cast,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: MyThemeData.SecondaryColor,
      ),
      child: Row(
        children: [
           Column(
             children: [
               Container(
                 width: 80,
                 height: 85,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(10),
                   child: Image.network(
                     cast.img,
                     width: 70,
                     height: 70,
                     fit: BoxFit.cover,
                   ),
                 ),
               ),
             ],
           ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : ${cast.name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.start,),
                Text("Character : ${cast.character}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
