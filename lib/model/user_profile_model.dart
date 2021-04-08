class UserProfile {
  int id;
  String name;
  String email;
  String image;
  String phone;
  String address;
  String active;
  EducationalLevel educationalLevel;
  EducationalLevel educationalGrade;
  var division;

  UserProfile(
      {this.id,
      this.name,
      this.email,
      this.image,
      this.phone,
      this.address,
      this.active,
      this.educationalLevel,
      this.educationalGrade,
      this.division});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    address = json['address'];
    active = json['active'];
    educationalLevel = json['educational_level'] != null
        ? new EducationalLevel.fromJson(json['educational_level'])
        : null;
    educationalGrade = json['educational_grade'] != null
        ? new EducationalLevel.fromJson(json['educational_grade'])
        : null;
    division = json['division'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['active'] = this.active;
    if (this.educationalLevel != null) {
      data['educational_level'] = this.educationalLevel.toJson();
    }
    if (this.educationalGrade != null) {
      data['educational_grade'] = this.educationalGrade.toJson();
    }
    data['division'] = this.division;
    return data;
  }
}

class EducationalLevel {
  int id;
  String name;

  EducationalLevel({this.id, this.name});

  EducationalLevel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
