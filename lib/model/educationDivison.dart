class EducationDivison {
  bool check;
  List<DataDivison > data;

  EducationDivison({this.check, this.data});

  EducationDivison.fromJson(Map<String, dynamic> json) {
    check = json['check'];
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<DataDivison >();
      json['data'].forEach((v) {
        data.add(new DataDivison .fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check'] = this.check;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataDivison  {
  int id;
  String name;

  DataDivison ({this.id, this.name});

  DataDivison .fromJson(Map<String, dynamic> json) {
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
