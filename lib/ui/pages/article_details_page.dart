import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/comment/comment_bloc.dart';
import 'package:flutter_bloc_demo/bloc/comment/comment_event.dart';
import 'package:flutter_bloc_demo/data/model/api_result_model.dart';
import 'package:flutter_bloc_demo/data/repository/comments_repository.dart';
import 'comments_page.dart';
import 'home_page.dart';

class PostDetailPage extends StatefulWidget {
  Posts posts;

  PostDetailPage({this.posts});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  CommentsBloc commentsBloc;

  @override
  void initState() {
    super.initState();
    commentsBloc = BlocProvider.of<CommentsBloc>(context);
    commentsBloc.add(FetchCommentEvent()); //Add Event To Bloc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Details Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              widget.posts.title,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(5.0),
            child: Text(widget.posts.body),
          ),
          SizedBox(height: 20.0,),
          Container(
            alignment: Alignment.center,
            child: InkWell(
                onTap: () {
                  navigateToArticleDetailPage(context);
                },
                child: Text("See Comments",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),)),
          ),
        ],
      ),
    );
  }

  ///Navigation Method
  void navigateToArticleDetailPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BlocProvider(
        builder: (context) =>
            CommentsBloc(commentsRepository: CommentsRepositoryImpl()),
        child: CommentsUIScreen(),
      );
    }));
  }
}
