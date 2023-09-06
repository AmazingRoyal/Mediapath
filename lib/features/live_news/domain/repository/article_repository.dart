import 'package:mediapath/core/resources/data_state.dart';
import 'package:mediapath/features/live_news/domain/entities/article.dart';

abstract class ArticleRepository {

  Future <DataState<List<ArticleEntity>>> getLiveArticle();
}