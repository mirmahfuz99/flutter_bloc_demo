import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_demo/data/model/api_result_model.dart';
import 'package:flutter_bloc_demo/data/model/comments_model.dart';

abstract class CommentsState extends Equatable {}

class CommentsInitialState extends CommentsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CommentsLoadingState extends CommentsState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CommentsLoadedState extends CommentsState {
  List<Comments> comments;

  CommentsLoadedState({@required this.comments});

  @override
  // TODO: implement props
  List<Object> get props => [comments];
}

class CommentsErrorState extends CommentsState {
  String message;

  CommentsErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
