
class User {
  int? id;
  String? name;
  String? email;
  String? lusername;

  User(this.id, this.name, this.email, this.lusername);

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        lusername = json['username'],
        email = json['email'];

  Map toJson() {
    return {'id': id, 'name': name, 'email': email, 'username': lusername};
  }
}