

class User {
  // ignore: non_constant_identifier_names
  String name;
  String email;
  String phone;
  String address;
  // ignore: non_constant_identifier_names
  int educationa_level_id;
  // ignore: non_constant_identifier_names
  int educationa_grade_id;
  // ignore: non_constant_identifier_names
  String api_tocken;
  // ignore: non_constant_identifier_names
  User(this.name, this.email, this.phone, this.address,
      this.educationa_level_id, this.educationa_grade_id, this.api_tocken);

  User.fromJson(Map<String, dynamic> jsonObject) {
    this.name = jsonObject['name'];
    this.email = jsonObject['email'];
    this.phone = jsonObject['phone'];
    this.address = jsonObject['address'];
    this.educationa_level_id = jsonObject['educationa_level_id'];
    this.educationa_grade_id = jsonObject['educationa_grade_id'];
    this.api_tocken = jsonObject['api_tocken'];
  }
}

class Login {
  String email;
  String password;

  Login({this.email, this.password});
  Login.fromJson(Map<String, dynamic> jsonObject) {
    this.email = jsonObject['email'];
    this.password = jsonObject['password'];
  }
}
