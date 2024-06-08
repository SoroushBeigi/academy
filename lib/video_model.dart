class VideoModel {
  int? id;
  int? categoryId;
  int? authorId;
  int? viewCount;
  String? title;
  String? description;
  String? authorName;
  String? url;
  String? imageUrl;
  String? duration;
  DateTime? publishTime;
  bool? isLive;

  VideoModel({
    this.id,
    this.categoryId,
    this.authorId,
    this.title,
    this.description,
    this.authorName,
    this.url,
    this.imageUrl,
    this.publishTime,
    this.isLive,
    this.viewCount,
    this.duration,
  });

  VideoModel.fromJson(dynamic json){
    id=json['id'];
    title=json['title'];
    description=json['description'];
    url=json['url'];
    categoryId=json['category_id'];
    authorId=json['author_id'];
    authorName=json['author_name'];
    imageUrl=json['image_url'];
    publishTime = DateTime.parse(json['CreatedAt']);
    isLive = json['is_live'];
    viewCount=json['view_count'];
    duration=json['duration'];
  }
}