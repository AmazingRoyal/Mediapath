import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? source;
  final String? image;
  final String? category;
  final String? language;
  final String? country;
  final String? publishedAt;

  const ArticleEntity ({
    this.author,
    this.title,
    this.description,
    this.url,
    this.source,
    this.image,
    this.category,
    this.language,
    this.country,
    this.publishedAt,
  });

  @override
  List <Object?> get props {
    return [
      author,
      title,
      description,
      url,
      source,
      image,
      category,
      language,
      country,
      publishedAt,
    ];
  }

}