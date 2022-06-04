class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;

  ShopLoginModel.fromJson(Map<String, dynamic> jsonResponse) {
    status = jsonResponse["status"];
    message = jsonResponse["message"];
    data = UserData.fromJson(jsonResponse["data"]);
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData.fromJson(Map<String, dynamic>? jsonResponse) {
    id = jsonResponse?["id"];
    name = jsonResponse?["name"];
    email = jsonResponse?["email"];
    phone = jsonResponse?["phone"];
    image = jsonResponse?["image"];
    credit = jsonResponse?["credit"];
    points = jsonResponse?["points"];
    token = jsonResponse?["token"];
  }
}
