class EducationGrade {
  List<DataGrade> data;

  EducationGrade({this.data});

  EducationGrade.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<DataGrade>();
      json['data'].forEach((v) {
        data.add(new DataGrade.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataGrade {
  int id;
  String name;
  int totalSubjects;
  int totalLessons;

  DataGrade({this.id, this.name, this.totalSubjects, this.totalLessons});

  DataGrade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    totalSubjects = json['total_subjects'];
    totalLessons = json['total_lessons'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['total_subjects'] = this.totalSubjects;
    data['total_lessons'] = this.totalLessons;
    return data;
  }
}
