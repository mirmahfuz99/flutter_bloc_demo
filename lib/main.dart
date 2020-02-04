import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/pages/splash_screen.dart';
import 'bloc/comment/comment_bloc.dart';
import 'bloc/post/post_bloc.dart';

void main() => runApp(MultiBlocProvider(///We have Two Bloc That's why MultiBloc
      providers: [
        BlocProvider<PostBloc>(
          create: (context) => PostBloc(),
        ),
        BlocProvider<CommentsBloc>(
          create: (context) => CommentsBloc(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
