class Lesson {
  Course course;
  List<Comments> comments;
  List<ListCourses> listCourses;

  Lesson({this.course, this.comments, this.listCourses});

  Lesson.fromJson(Map<String, dynamic> json) {
    course =
        json['course'] != null ? new Course.fromJson(json['course']) : null;
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
    if (json['list_courses'] != null) {
      listCourses = new List<ListCourses>();
      json['list_courses'].forEach((v) {
        listCourses.add(new ListCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['course'] = this.course.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    if (this.listCourses != null) {
      data['list_courses'] = this.listCourses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Course {
  int id;
  String name;
  String teacher;
  String description;
  String videoLink;
  List<Attachments> attachments;
  String image;

  Course(
      {this.id,
      this.name,
      this.teacher,
      this.description,
      this.videoLink,
      this.attachments,
      this.image});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    teacher = json['teacher'];
    description = json['description'];
    videoLink = json['video_link'];
    if (json['attachments'] != null) {
      attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        attachments.add(new Attachments.fromJson(v));
      });
    }
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['teacher'] = this.teacher;
    data['description'] = this.description;
    data['video_link'] = this.videoLink;
    if (this.attachments != null) {
      data['attachments'] = this.attachments.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    return data;
  }
}

class Attachments {
  int id;
  String attachment;

  Attachments({this.id, this.attachment});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attachment'] = this.attachment;
    return data;
  }
}

class Comments {
  int id;
  String comment;
  String username;
  String userImage;

  Comments({this.id, this.comment, this.username, this.userImage});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    username = json['username'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['username'] = this.username;
    data['user_image'] = this.userImage;
    return data;
  }
}

class ListCourses {
  int id;
  String name;
  String views;
  String image;

  ListCourses({this.id, this.name, this.views, this.image});

  ListCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    views = json['views'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['views'] = this.views;
    data['image'] = this.image;
    return data;
  }
}
