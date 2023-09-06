import 'dart:io';

import 'package:mediapath/core/constants/constants.dart';
import 'package:mediapath/core/resources/data_state.dart';
import 'package:mediapath/features/live_news/data/data_sources/remote/news_api_service.dart';
import 'package:mediapath/features/live_news/data/models/article.dart';
import 'package:mediapath/features/live_news/domain/repository/article_repository.dart';

import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future <DataState<List<ArticleModel>>> getLiveArticle() async {
    try {
      final httpResponse = await _newsApiService.getLiveArticles(
          accessKey: accessKey
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions,
            )
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }

  }
}