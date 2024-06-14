class ContentEntity {
  final int? id;
  final String? title;
  final String? description;
  final String? url;
  final int? categoryId;
  final int? authorId;
  final String? authorName;
  final DateTime? createdAt;
  final String? imageUrl;
  final int? viewCount;
  final String? duration;
  final bool? isLive;
  final String? mainFilePath;
  final String? mainFileType;
  final List<int>? categoryIds;
  final List<Category>? categories;
  final List<Attachment>? attachments;
  final List<Comment>? comments;
  final List<String>? tags;

  bool? is_approved;

  ContentEntity({
    this.id,
    this.title,
    this.description,
    this.url,
    this.categoryId,
    this.authorId,
    this.authorName,
    this.createdAt,
    this.imageUrl,
    this.viewCount,
    this.duration,
    this.isLive,
    this.mainFilePath,
    this.mainFileType,
    this.categoryIds,
    this.categories,
    this.attachments,
    this.comments,
    this.tags,
    this.is_approved,
  });

  factory ContentEntity.fromJson(Map<String, dynamic> json) {
    return ContentEntity(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      categoryId: json['category_id'],
      authorId: json['author_id'],
      authorName: json['author_name'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      imageUrl: json['image_url'],
      viewCount: json['view_count'],
      duration: json['duration'],
      isLive: json['is_live'],
      mainFilePath: json['main_file_path'],
      mainFileType: json['main_file_type'],
      categoryIds: json['category_ids'] != null ? List<int>.from(json['category_ids']) : null,
      categories: json['categories'] != null
          ? (json['categories'] as List).map((i) => Category.fromJson(i)).toList()
          : null,
      attachments: json['attachments'] != null
          ? (json['attachments'] as List).map((i) => Attachment.fromJson(i)).toList()
          : null,
      comments: json['comments'] != null
          ? (json['comments'] as List).map((i) => Comment.fromJson(i)).toList()
          : null,
      tags: json['Tags'] != null ? List<String>.from(json['Tags']) : null,
      is_approved: json['is_approved'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'url': url,
      'category_id': categoryId,
      'author_id': authorId,
      'author_name': authorName,
      'created_at': createdAt?.toIso8601String(),
      'image_url': imageUrl,
      'view_count': viewCount,
      'duration': duration,
      'is_live': isLive,
      'main_file_path': mainFilePath,
      'main_file_type': mainFileType,
      'category_ids': categoryIds,
      'categories': categories?.map((category) => category.toJson()).toList(),
      'attachments': attachments?.map((attachment) => attachment.toJson()).toList(),
      'comments': comments?.map((comment) => comment.toJson()).toList(),
      'Tags': tags,
      'is_approved': is_approved,
    };
  }
}

class Category {
  final int? id;
  final String? name;
  final String? description;

  Category({
    this.id,
    this.name,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}

class Attachment {
  final int? id;
  final int? contentId;
  final String? filePath;
  final String? fileType;
  final DateTime? createdAt;

  Attachment({
    this.id,
    this.contentId,
    this.filePath,
    this.fileType,
    this.createdAt,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'],
      contentId: json['content_id'],
      filePath: json['file_path'],
      fileType: json['file_type'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content_id': contentId,
      'file_path': filePath,
      'file_type': fileType,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}

class Comment {
  final int? id;
  final int? contentId;
  final int? userId;
  final String? text;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Comment({
    this.id,
    this.contentId,
    this.userId,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      contentId: json['content_id'],
      userId: json['user_id'],
      text: json['text'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content_id': contentId,
      'user_id': userId,
      'text': text,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
