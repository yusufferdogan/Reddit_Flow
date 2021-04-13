import 'package:app_nation_project/models/post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class PostsPageState extends Equatable {}

class PostsInitState extends PostsPageState {
  @override
  List<Object> get props => [];
}

class PostsLoading extends PostsPageState {
  @override
  List<Object> get props => [];
}

class PostsLoaded extends PostsPageState {
  final List<Post> posts;

  List<Post> get getPosts => posts;

  PostsLoaded({@required this.posts});

  @override
  List<Object> get props => [posts];
}
