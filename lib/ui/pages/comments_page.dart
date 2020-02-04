import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/comment/comment_bloc.dart';
import 'package:flutter_bloc_demo/bloc/comment/comment_event.dart';
import 'package:flutter_bloc_demo/bloc/comment/comment_state.dart';
import 'package:flutter_bloc_demo/data/model/comments_model.dart';

class CommentsUIScreen extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<CommentsUIScreen> {
  CommentsBloc commentsBloc;

  @override
  void initState() {
    super.initState();
    commentsBloc = BlocProvider.of<CommentsBloc>(context);
    commentsBloc.add(FetchCommentEvent()); //Add Event To Bloc
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              body: BlocListener<CommentsBloc, CommentsState>(
                listener: (context, state) {
                  if (state is CommentsErrorState) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                    ));
                  }
                },
                child: BlocBuilder<CommentsBloc, CommentsState>(
                  ///checking state
                  builder: (context, state) {
                    {
                      if (state is CommentsInitialState) {
                        return buildLoading();
                      } else if (state is CommentsLoadingState) {
                        ///loading state
                        return buildLoading();
                      } else if (state is CommentsLoadedState) {
                        ///Loaded State
                        print(state.comments.length);
                        return buildPostList(state.comments);
                      } else if (state is CommentsErrorState) {
                        return buildErrorUi(state.message);
                      }
                      return new Container();
                      ///default return
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ///Loading Widget
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  ///Error Widget
  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  ///Post List Widget
  Widget buildPostList(List<Comments> comments) {
    print("comments_length");
    print(comments.length);
    return new ListView.builder(
//        itemCount: comments.length,
        itemCount: 30,
        itemBuilder: (BuildContext ctxt, int index) {
          return new ListTile(
           title: Text(
             comments.elementAt(index).name,
             style: TextStyle(fontSize: 20.0),
           ),
            subtitle: Text(comments.elementAt(index).body),
          );
        });
  }
}
