class MyExams {
  Data data;

  MyExams({this.data});

  MyExams.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<DataMyExams> data;
  Pagination pagination;

  Data({this.data, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<DataMyExams>();
      json['data'].forEach((v) {
        data.add(new DataMyExams.fromJson(v));
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

class DataMyExams {
  int id;
  String status;
  String name;
  Level level;
  Level grade;
  Level subject;
  int questionsCount;
  int examDegrees;
  int answeredQuestions;

  DataMyExams(
      {this.id,
      this.status,
      this.name,
      this.level,
      this.grade,
      this.subject,
      this.questionsCount,
      this.examDegrees,
      this.answeredQuestions});

  DataMyExams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
    grade = json['grade'] != null ? new Level.fromJson(json['grade']) : null;
    subject =
        json['subject'] != null ? new Level.fromJson(json['subject']) : null;
    questionsCount = json['questions_count'];
    examDegrees = json['exam_degrees'];
    answeredQuestions = json['answered_questions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['name'] = this.name;
    if (this.level != null) {
      data['level'] = this.level.toJson();
    }
    if (this.grade != null) {
      data['grade'] = this.grade.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject.toJson();
    }
    data['questions_count'] = this.questionsCount;
    data['exam_degrees'] = this.examDegrees;
    data['answered_questions'] = this.answeredQuestions;
    return data;
  }
}

class Level {
  int id;
  String name;

  Level({this.id, this.name});

  Level.fromJson(Map<String, dynamic> json) {
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
