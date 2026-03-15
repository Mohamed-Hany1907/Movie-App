class UserModel {
  String id;
  String name;
  String email;
  String phoneNumber;
  String imagePath;
    
     UserModel({
      required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.imagePath
     });

     UserModel.fromJson(Map<String , dynamic> json) : this
    (
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      imagePath: json["imagePath"] ?? ""
    );

    toJson(){
      return {
        "id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "imagePath": imagePath
      };
    }
}