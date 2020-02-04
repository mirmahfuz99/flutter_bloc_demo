import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/post/post_bloc.dart';
import 'package:flutter_bloc_demo/data/repository/post_repository.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 160,
        child: Image.asset(
          "assets/logo.png",
          height: 150,
        ),
      ),
    ));
  }

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            builder: (context) =>
                PostBloc(postRepository: PostsRepositoryImpl()),
            child: HomePage(),
          ),
        ),
      );
    });
    super.initState();
  }
}
