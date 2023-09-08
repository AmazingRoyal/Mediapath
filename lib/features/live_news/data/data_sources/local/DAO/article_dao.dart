import 'package:floor/floor.dart';
import 'package:mediapath/features/live_news/data/models/article.dart';

@dao
abstract class ArticleDao {

  @Insert()
  Future<void> insertArticle(ArticleModel articleModel);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  @Query("SELECT * FROM article")
  Future<List<ArticleModel>> getArticles();


}