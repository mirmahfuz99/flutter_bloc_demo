import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo/data/model/comments_model.dart';
import 'package:flutter_bloc_demo/data/repository/comments_repository.dart';

import 'comment_event.dart';
import 'comment_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsRepository commentsRepository;

  CommentsBloc({@required this.commentsRepository});

//  PostRe repository;
  @override
  // TODO: implement initialState
  CommentsState get initialState => CommentsInitialState();

  @override
  Stream<CommentsState> mapEventToState(CommentsEvent event) async* {
    if (event is FetchCommentEvent) {
      yield CommentsLoadingState();
      try {
        List<Comments> posts = await commentsRepository.getComments();
        yield CommentsLoadedState(comments: posts);
      } catch (e) {
        yield CommentsErrorState(message: e.toString());
      }
    }
  }
}
