class FilmModel {
   String image;
  double rate;

   FilmModel({
    required this.image,
    required this.rate
   });
}

 
  List <FilmModel> filmsList =[
    FilmModel(image: "assets/images/film1.png", rate: 8),
    FilmModel(image: "assets/images/film2.jpeg", rate: 7.7),
    FilmModel(image: "assets/images/film3.jpeg", rate: 8.8),
    FilmModel(image: "assets/images/film4.png", rate: 7.7),
    FilmModel(image: "assets/images/img.png", rate: 7.0),
    FilmModel(image: "assets/images/img_1.png", rate: 7.2),
    FilmModel(image: "assets/images/img_2.png", rate: 9.0),
    FilmModel(image: "assets/images/img_3.png", rate: 8.0),

  ];