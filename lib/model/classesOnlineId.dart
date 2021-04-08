class ClassesOnlineId {
  DataClassesOnlineId data;
  String signature;

  ClassesOnlineId({this.data, this.signature});

  ClassesOnlineId.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new DataClassesOnlineId.fromJson(json['data'])
        : null;
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['signature'] = this.signature;
    return data;
  }
}

class DataClassesOnlineId {
  int id;
  String domain;
  String appkey;
  String appsecret;
  int userid;
  String meetingId;
  String roomTitle;
  String datetime;
  String time;
  String joinUrl;
  String createdAt;

  DataClassesOnlineId(
      {this.id,
      this.domain,
      this.appkey,
      this.appsecret,
      this.userid,
      this.meetingId,
      this.roomTitle,
      this.datetime,
      this.time,
      this.joinUrl,
      this.createdAt});

  DataClassesOnlineId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    appkey = json['appkey'];
    appsecret = json['appsecret'];
    userid = json['userid'];
    meetingId = json['meeting_id'];
    roomTitle = json['room_title'];
    datetime = json['datetime'];
    time = json['time'];
    joinUrl = json['join_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['domain'] = this.domain;
    data['appkey'] = this.appkey;
    data['appsecret'] = this.appsecret;
    data['userid'] = this.userid;
    data['meeting_id'] = this.meetingId;
    data['room_title'] = this.roomTitle;
    data['datetime'] = this.datetime;
    data['time'] = this.time;
    data['join_url'] = this.joinUrl;
    data['created_at'] = this.createdAt;
    return data;
  }
}
