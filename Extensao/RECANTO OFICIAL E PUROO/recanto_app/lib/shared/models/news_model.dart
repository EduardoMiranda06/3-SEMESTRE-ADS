/// Modelo de Notícia
class NewsModel {
  final String id;
  final String title;
  final String description;
  final String content;
  final String? imageUrl;
  final DateTime publishedAt;
  final String author;
  final List<String> tags;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    this.imageUrl,
    required this.publishedAt,
    required this.author,
    this.tags = const [],
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      author: json['author'] as String,
      tags: List<String>.from(json['tags'] as List? ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'content': content,
      'imageUrl': imageUrl,
      'publishedAt': publishedAt.toIso8601String(),
      'author': author,
      'tags': tags,
    };
  }

  NewsModel copyWith({
    String? id,
    String? title,
    String? description,
    String? content,
    String? imageUrl,
    DateTime? publishedAt,
    String? author,
    List<String>? tags,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      author: author ?? this.author,
      tags: tags ?? this.tags,
    );
  }
}