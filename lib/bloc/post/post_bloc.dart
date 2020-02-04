import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/bloc/post/post_event.dart';
import 'package:flutter_bloc_demo/bloc/post/post_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/data/model/api_result_model.dart';
import 'package:flutter_bloc_demo/data/repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository;

  PostBloc({@required this.postRepository});

//  PostRe repository;
  @override
  // TODO: implement initialState
  PostState get initialState => PostInitialState();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPostEvent) {
      yield PostLoadingState();
      try {
        List<Posts> posts = await postRepository.getPosts();
        yield PostLoadedState(posts: posts);
      } catch (e) {
        yield PostErrorState(message: e.toString());
      }
    }
  }
}
