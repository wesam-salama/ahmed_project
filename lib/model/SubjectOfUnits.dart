class SubjectOfUnit {
  Subject subject;
  Units units;

  SubjectOfUnit({this.subject, this.units});

  SubjectOfUnit.fromJson(Map<String, dynamic> json) {
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    units = json['units'] != null ? new Units.fromJson(json['units']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    if (this.units != null) {
      data['units'] = this.units.toJson();
    }
    return data;
  }
}

class Subject {
  int id;
  String subject;
  String educationaLevelId;
  String educationaGradeId;

  Subject(
      {this.id, this.subject, this.educationaLevelId, this.educationaGradeId});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    educationaLevelId = json['educationa_level_id'];
    educationaGradeId = json['educationa_grade_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['educationa_level_id'] = this.educationaLevelId;
    data['educationa_grade_id'] = this.educationaGradeId;
    return data;
  }
}

class Units {
  List<DataUnits> data;
  Pagination pagination;

  Units({this.data, this.pagination});

  Units.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<DataUnits>();
      json['data'].forEach((v) {
        data.add(new DataUnits.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    return data;
  }
}

class DataUnits {
  int id;
  String name;

  DataUnits({this.id, this.name});

  DataUnits.fromJson(Map<String, dynamic> json) {
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

class Pagination {
  int total;
  int count;
  int perPage;
  int currentPage;
  int totalPages;

  Pagination(
      {this.total,
      this.count,
      this.perPage,
      this.currentPage,
      this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['per_page'];
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['per_page'] = this.perPage;
    data['current_page'] = this.currentPage;
    data['total_pages'] = this.totalPages;
    return data;
  }
}
