
import 'package:mediapath/core/constants/constants.dart';
import 'package:mediapath/features/live_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/news")
  Future <HttpResponse<List<ArticleModel>>> getLiveArticles ({
    @Query("access_key") String? accessKey,
  });
}