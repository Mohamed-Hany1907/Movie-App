import 'package:flutter/material.dart';
import 'package:movies_app/serveces/api_manager.dart';
import 'package:movies_app/screens/tabs/home_tab/horizontalListWidget.dart';

class FilmSearchScreen extends StatefulWidget {
  @override
  _FilmSearchScreenState createState() => _FilmSearchScreenState();
}

class _FilmSearchScreenState extends State<FilmSearchScreen> {
  String searchQuery = "";
  List movies = [];
  bool isSearching = false;

  void performSearch(String query) async {
    setState(() {
      searchQuery = query;
      isSearching = query.isNotEmpty;
    });
    if (isSearching) {
      var response = await ApiManager.getMoviesList();
      setState(() {
        movies = response?.data?.movies
            ?.where((movie) => movie.title!.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList() ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.white),
          ),
          onChanged: (value) {
            performSearch(value);
          },
        ),
      ),
      body: isSearching && movies.isNotEmpty
          ? GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Hhorizontallistwidget(
            movie: movies[index],
            containerHeight: 250,
            containerWidth: double.infinity,
          );
        },
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/popcorn2.png", width: 150, height: 150),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
