import 'package:mediapath/features/live_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    String? author,
    String? title,
    String? description,
    String? url,
    String? source,
    String? image,
    String? category,
    String? language,
    String? country,
    String? publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      source: map['source'] ?? "",
      image: map['image'] ?? "",
      category: map['category'] ?? "",
      language: map['language'] ?? "",
      country: map['country'] ?? "",
      publishedAt: map['published_at'] ?? "",
    );
  }

}