class NewsDetails {
  News2 news;

  NewsDetails({this.news});

  NewsDetails.fromJson(Map<String, dynamic> json) {
    news = json['news'] != null ? new News2.fromJson(json['news']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news.toJson();
    }
    return data;
  }
}

class News2 {
  int id;
  String title;
  String desc;
  String image;
  String published;

  News2({this.id, this.title, this.desc, this.image, this.published});

  News2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    image = json['image'];
    published = json['published'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['published'] = this.published;
    return data;
  }
}
