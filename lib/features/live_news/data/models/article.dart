import 'package:floor/floor.dart';
import 'package:mediapath/features/live_news/domain/entities/article.dart';

@Entity(tableName: 'article', primaryKeys: ['url'])
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
  }) : super(
     author: author,
     title: title,
     description: description,
     url: url,
     source: source,
     image: image,
     category: category,
     language: language,
     country: country,
     publishedAt: publishedAt
   );

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

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        source: entity.source,
        image: entity.image,
        category: entity.category,
        language: entity.language,
        country: entity.country,
        publishedAt: entity.publishedAt,
    );
  }

}