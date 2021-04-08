class ClassesOnline {
  Data data;

  ClassesOnline({this.data});

  ClassesOnline.fromJson(Map<String, dynamic> json) {
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
  List<DataClassesOnline> data;
  Pagination pagination;

  Data({this.data, this.pagination});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = new List<DataClassesOnline>();
      json['data'].forEach((v) {
        data.add(new DataClassesOnline.fromJson(v));
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

class DataClassesOnline {
  int id;
  String roomId;
  String roomTitle;
  String datetime;
  String time;
  String joinUrl;
  String createdAt;

  DataClassesOnline(
      {this.id,
      this.roomId,
      this.roomTitle,
      this.datetime,
      this.time,
      this.joinUrl,
      this.createdAt});

  DataClassesOnline.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['room_id'];
    roomTitle = json['room_title'];
    datetime = json['datetime'];
    time = json['time'];
    joinUrl = json['join_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['room_id'] = this.roomId;
    data['room_title'] = this.roomTitle;
    data['datetime'] = this.datetime;
    data['time'] = this.time;
    data['join_url'] = this.joinUrl;
    data['created_at'] = this.createdAt;
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
