import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediapath/core/resources/data_state.dart';
import 'package:mediapath/core/usecases/get_article.dart';
import 'package:mediapath/features/live_news/presentation/bloc/article/remote_article_event.dart';
import 'package:mediapath/features/live_news/presentation/bloc/article/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState>{

  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase) : super(const RemoteArticleLoading()) {
    on<GetArticles> (onGetArticle);
  }

  void onGetArticle(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print(dataState.data);
      emit(
        RemoteArticleDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      print(dataState.error!);
      emit(
        RemoteArticleError(dataState.error!)
      );
    }
  }
}