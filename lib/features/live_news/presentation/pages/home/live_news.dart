import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediapath/features/live_news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:mediapath/features/live_news/presentation/bloc/article/remote_article_event.dart';
import 'package:mediapath/features/live_news/presentation/bloc/article/remote_article_state.dart';
import 'package:mediapath/features/live_news/presentation/widgets/article_tile.dart';

class LiveNews extends StatelessWidget {
  const LiveNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Live News",
        style: TextStyle(
          color: Colors.black
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator(),);
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.refresh),);
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: ArticleWidget(
                  article: state.articles![index],
                ),
              );
            }
          );
        }
        return const SizedBox();
      }
    );
  }
}
