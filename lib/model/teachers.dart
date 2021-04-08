class Teachers {
  List<DataTeachers> data;

  Teachers({this.data});

  Teachers.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<DataTeachers>();
      json['data'].forEach((v) {
        data.add(new DataTeachers.fromJson(v));
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

class DataTeachers {
  int id;
  String name;
  String subject;
  String image;

  DataTeachers({this.id, this.name, this.subject, this.image});

  DataTeachers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subject = json['subject'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['subject'] = this.subject;
    data['image'] = this.image;
    return data;
  }
}
