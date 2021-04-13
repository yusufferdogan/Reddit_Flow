import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class FetchPosts extends PostEvent {
  @override
  List<Object> get props => [];
}
