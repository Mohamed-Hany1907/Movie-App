class Watchlistmodel {
  String id;
  String image;
  double rating;
   
  Watchlistmodel({
    required this.id,
    required this.image,
    required this.rating,
  }); 
     
}class WatchlistModel {
  String id;
  String image;
  double rating;

  WatchlistModel({
    required this.id,
    required this.image,
    required this.rating,
  });

  // Convert a WatchlistModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'rating': rating,
    };
  }

  // Create a WatchlistModel instance from a JSON map
  factory WatchlistModel.fromJson(Map<String, dynamic> json) {
    return WatchlistModel(
      id: json['id'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
