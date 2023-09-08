import 'package:mediapath/core/resources/data_state.dart';
import 'package:mediapath/core/usecases/usecase.dart';
import 'package:mediapath/features/live_news/domain/entities/article.dart';
import 'package:mediapath/features/live_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {

  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getLiveArticle();
  }
  
}