import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_demo/data/model/api_result_model.dart';

abstract class PostState extends Equatable {}

class PostInitialState extends PostState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PostLoadedState extends PostState {
  List<Posts> posts;

  PostLoadedState({@required this.posts});

  @override
  // TODO: implement props
  List<Object> get props => [posts];
}

class PostErrorState extends PostState {
  String message;

  PostErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
