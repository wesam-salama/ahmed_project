class SubjectsModel {
  Grade grade;
  List<SubjectsData> subjects;

  SubjectsModel({this.grade, this.subjects});

  SubjectsModel.fromJson(Map<String, dynamic> json) {
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    if (json['subjects'] != null) {
      // ignore: deprecated_member_use
      subjects = new List<SubjectsData>();
      json['subjects'].forEach((v) {
        subjects.add(new SubjectsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.grade != null) {
      data['grade'] = this.grade.toJson();
    }
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Grade {
  int id;
  String name;

  Grade({this.id, this.name});

  Grade.fromJson(Map<String, dynamic> json) {
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

class SubjectsData {
  int id;
  String name;
  int lessonsNumber;
  int watched;

  SubjectsData({this.id, this.name, this.lessonsNumber, this.watched});

  SubjectsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lessonsNumber = json['lessons_number'];
    watched = json['watched'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lessons_number'] = this.lessonsNumber;
    data['watched'] = this.watched;
    return data;
  }
}
