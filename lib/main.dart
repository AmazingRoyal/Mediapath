import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediapath/features/live_news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:mediapath/features/live_news/presentation/bloc/article/remote_article_event.dart';
import 'package:mediapath/features/live_news/presentation/pages/home/live_news.dart';
import 'package:mediapath/injection_container.dart';

import 'config/theme/app_theme.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticles()),
      child: MaterialApp(
        theme: theme(),
        home: const LiveNews(),
      ),
    );
  }
  
}