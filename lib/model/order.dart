class Order {
  List<DataOrder> data;

  Order({this.data});

  Order.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<DataOrder>();
      json['data'].forEach((v) {
        data.add(new DataOrder.fromJson(v));
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

class DataOrder {
  int id;
  String level;
  String grade;
  String startDate;
  String endDate;
  String status;
  List<Details> details;

  DataOrder(
      {this.id,
      this.level,
      this.grade,
      this.startDate,
      this.endDate,
      this.status,
      this.details});

  DataOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    grade = json['grade'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    if (json['details'] != null) {
      // ignore: deprecated_member_use
      details = new List<Details>();
      json['details'].forEach((v) {
        details.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['level'] = this.level;
    data['grade'] = this.grade;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String name;
  String term;

  Details({this.name, this.term});

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    term = json['term'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['term'] = this.term;
    return data;
  }
}
