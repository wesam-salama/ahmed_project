class Exams {
  Exam exam;
  List<Questions> questions;

  Exams({this.exam, this.questions});

  Exams.fromJson(Map<String, dynamic> json) {
    exam = json['exam'] != null ? new Exam.fromJson(json['exam']) : null;
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
    if (this.exam != null) {
      data['exam'] = this.exam.toJson();
    }
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exam {
  int id;
  String userId;
  String examId;
  String status;
  String createdAt;
  String updatedAt;
  Exam exam;

  Exam(
      {this.id,
      this.userId,
      this.examId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.exam});

  Exam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    examId = json['exam_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    exam = json['exam'] != null ? new Exam.fromJson(json['exam']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['exam_id'] = this.examId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.exam != null) {
      data['exam'] = this.exam.toJson();
    }
    return data;
  }
}

class ExamNum {
  int id;
  String name;

  ExamNum({this.id, this.name});

  ExamNum.fromJson(Map<String, dynamic> json) {
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
  Null checkboxAnswer;
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
