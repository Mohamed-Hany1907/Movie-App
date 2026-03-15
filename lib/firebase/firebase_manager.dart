import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/user_model.dart';
import 'package:movies_app/models/watchListModel.dart';
import 'package:movies_app/provider/user_provider.dart';
import 'package:movies_app/screens/auth/create_account.dart';
import 'package:provider/provider.dart';
class FirebaseManager {
  // this function to create user collection in firebase
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(
            snapshot.data()!); //fromfirestore takes map and return model
      },
      toFirestore: (model, _) {
        return model.toJson();
      },
    );
  }

  // this function will store the user email in new collection and every user has itis id to call from it
  static Future<void> addUser(UserModel user) {
    var collection =
        getUserCollection(); // i enhanced my code with the gettaskcolle to refactor it to avoid multi implement of it and i stored it in var called collection
    // now i want to create new document and set itis id as my id
    var docRev = collection.doc(user.id); //now create new document with the user id
    // i set the id to task to find the user and search about him using id
    return docRev.set(user); // i tell him to set this task which i pass to it
  }

  // by this function i can pass email and password to it and it will create them
  static Future<void> createAccount(String emailAddress, String password,String name, String phoneNumber,String imageUrl, 
      Function onSuccess, Function onLoading, Function onError) async {
    try {
      onLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      credential.user!
          .sendEmailVerification(); // this line will send emaill verification to the logged account
      UserModel userModel = UserModel(
             id: credential.user!.uid,
             name: name,
              email: emailAddress,
               phoneNumber: phoneNumber,
               imagePath: imageUrl,
               );
          addUser(userModel);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
      }
    } catch (e) {
      onError("something went error");
      print(e);
    }
  }
  //now i will create a function to login with email and password
  static Future<void>logIn(String email , String password,Function onLoading , Function onSuccess , Function onError )
  async{
    try {
      onLoading();
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );
   
    //  if(credential.user!.emailVerified)
    //  {
        onSuccess();
    //  }
    //  else
    //  {
    //    onError("please verify your email");
    //  }
} on FirebaseAuthException catch (e) {
    onError(e.message);
    print(e.message);
}
  }

  // this function to read user data from firestore and pass it to provider to hold user data to use it in profile
 static Future<UserModel?> readUser()async{

    var collection = getUserCollection();
    DocumentSnapshot<UserModel> docRev =await collection.doc(FirebaseAuth.instance.currentUser!.uid).get(); // now i hold the user document
    return docRev.data();
  }
  static Future<void> logOut()async
  {
   await FirebaseAuth.instance.signOut();
  }

  signOut() {}


// here is the watch list movies collection
static CollectionReference<WatchlistModel> getMoviesCollection(){
    return FirebaseFirestore.instance.collection("Watch Movies").
    withConverter<WatchlistModel>(
      fromFirestore: (snapshot, _) {
        return WatchlistModel.fromJson(snapshot.data()!); //fromfirestore takes map and return model 
      },
       toFirestore: (model, _) {
         return model.toJson();
       },)
       ;
}
      
     static Future<void> addMovies(WatchlistModel movie)
  {
    var collection = getMoviesCollection();    // i enhanced my code with the gettaskcolle to refactor it to avoid multi implement of it and i stored it in var called collection 
     // now i want to create new document and set itis id as my id 
     var docRev = collection.doc(); //now create new document 
     movie.id = docRev.id;  // here i set the doc id to the task id
     return docRev.set(movie); // i tell him to set this task which i pass to it
  }
   
  static Stream<QuerySnapshot<WatchlistModel>> getMovies(){
           
           var collection = getMoviesCollection();
           return collection.snapshots();
           
    }
    // this function to delete the movie from the watch list
    static Future<void>deleteMovie(String id)//the return type is future<void>
  {
    var collection = getMoviesCollection(); // first i hols the collection 
    return collection.doc(id).delete();// secend i go to the document depending on it is id and delete it
  }
 static Future<void> updateUserName(String userId, String newName, BuildContext context) async {
  DocumentReference userRef = FirebaseFirestore.instance.collection("Users").doc(userId);

  try {
    await userRef.update({"name": newName});

    

    print("✅ Name updated successfully!");
  } catch (e) {
    print("❌ Error updating name: $e");
  }
}



}

