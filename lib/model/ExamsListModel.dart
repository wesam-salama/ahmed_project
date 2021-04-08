class ExamsList {
  int currentPage;
  List<DataExams> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  ExamsList(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  ExamsList.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<DataExams>();
      json['data'].forEach((v) {
        data.add(new DataExams.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class DataExams {
  int id;
  String levelId;
  String gradeId;
  String subjectId;
  String term;
  String name;
  String image;
  String status;
  String startDate;
  String endDate;
  String createdAt;
  String updatedAt;
  List<Questions> questions;

  DataExams(
      {this.id,
      this.levelId,
      this.gradeId,
      this.subjectId,
      this.term,
      this.name,
      this.image,
      this.status,
      this.startDate,
      this.endDate,
      this.createdAt,
      this.updatedAt,
      this.questions});

  DataExams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    levelId = json['level_id'];
    gradeId = json['grade_id'];
    subjectId = json['subject_id'];
    term = json['term'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['questions'] != null) {
      // ignore: deprecated_member_use
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level_id'] = this.levelId;
    data['grade_id'] = this.gradeId;
    data['subject_id'] = this.subjectId;
    data['term'] = this.term;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int id;
  String examId;
  String type;
  String total;
  String question;
  String chooseAnswer1;
  String chooseAnswer2;
  String chooseAnswer3;
  String chooseAnswer4;
  Null chooseAnswer5;
  String trueChoose;
  String checkboxAnswer;
  Null articleAnswer;
  Null chooseImg1;
  Null chooseImg2;
  Null chooseImg3;
  Null chooseImg4;
  Null chooseImg5;
  Null trueChooseImg;
  Null image;
  String createdAt;
  String updatedAt;

  Questions(
      {this.id,
      this.examId,
      this.type,
      this.total,
      this.question,
      this.chooseAnswer1,
      this.chooseAnswer2,
      this.chooseAnswer3,
      this.chooseAnswer4,
      this.chooseAnswer5,
      this.trueChoose,
      this.checkboxAnswer,
      this.articleAnswer,
      this.chooseImg1,
      this.chooseImg2,
      this.chooseImg3,
      this.chooseImg4,
      this.chooseImg5,
      this.trueChooseImg,
      this.image,
      this.createdAt,
      this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    examId = json['exam_id'];
    type = json['type'];
    total = json['total'];
    question = json['question'];
    chooseAnswer1 = json['choose_answer_1'];
    chooseAnswer2 = json['choose_answer_2'];
    chooseAnswer3 = json['choose_answer_3'];
    chooseAnswer4 = json['choose_answer_4'];
    chooseAnswer5 = json['choose_answer_5'];
    trueChoose = json['true_choose'];
    checkboxAnswer = json['checkbox_answer'];
    articleAnswer = json['article_answer'];
    chooseImg1 = json['choose_img_1'];
    chooseImg2 = json['choose_img_2'];
    chooseImg3 = json['choose_img_3'];
    chooseImg4 = json['choose_img_4'];
    chooseImg5 = json['choose_img_5'];
    trueChooseImg = json['true_choose_img'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['exam_id'] = this.examId;
    data['type'] = this.type;
    data['total'] = this.total;
    data['question'] = this.question;
    data['choose_answer_1'] = this.chooseAnswer1;
    data['choose_answer_2'] = this.chooseAnswer2;
    data['choose_answer_3'] = this.chooseAnswer3;
    data['choose_answer_4'] = this.chooseAnswer4;
    data['choose_answer_5'] = this.chooseAnswer5;
    data['true_choose'] = this.trueChoose;
    data['checkbox_answer'] = this.checkboxAnswer;
    data['article_answer'] = this.articleAnswer;
    data['choose_img_1'] = this.chooseImg1;
    data['choose_img_2'] = this.chooseImg2;
    data['choose_img_3'] = this.chooseImg3;
    data['choose_img_4'] = this.chooseImg4;
    data['choose_img_5'] = this.chooseImg5;
    data['true_choose_img'] = this.trueChooseImg;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
