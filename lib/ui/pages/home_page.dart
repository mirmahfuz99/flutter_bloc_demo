import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/bloc/post/post_bloc.dart';
import 'package:flutter_bloc_demo/bloc/post/post_event.dart';
import 'package:flutter_bloc_demo/bloc/post/post_state.dart';
import 'package:flutter_bloc_demo/data/model/api_result_model.dart';
import 'article_details_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostBloc postBloc;

  @override
  void initState() {
    super.initState();
    postBloc = BlocProvider.of<PostBloc>(context);
    postBloc.add(FetchPostEvent());//Add Event To Bloc
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Post Page"),
              ),
              body: BlocListener<PostBloc, PostState>(
                listener: (context, state) {
                  if (state is PostErrorState) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                    ));
                  }
                },
                child: BlocBuilder<PostBloc, PostState>( ///checking state
                  builder: (context, state) {
                    {
                      if (state is PostInitialState) {
                        return buildLoading();
                      } else if (state is PostLoadingState) {
                        return buildLoading();
                      } else if (state is PostLoadedState) {
                        print("postLength");
                        print(state.posts.length);
                        return buildPostList(state.posts);
                      } else if (state is PostErrorState) {
                        return buildErrorUi(state.message);
                      }
                      return new Container(); ///default return
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
  Widget buildPostList(List<Posts> post) {
    return new ListView.builder(
        itemCount: post.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return InkWell(
            onTap: (){
              navigateToArticleDetailPage(context,post.elementAt(index));
            },
            child: new Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(post.elementAt(index).title,style: TextStyle(fontSize: 20.0),),
              ),
            ),
          );
        });
    ;
  }

 ///Navigation Method
 void navigateToArticleDetailPage(BuildContext context, Posts post) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostDetailPage(
        posts: post,
      );
    }));
  }

}
