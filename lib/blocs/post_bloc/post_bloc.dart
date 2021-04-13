import 'package:app_nation_project/models/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_nation_project/services/post_service.dart';
import 'bloc.dart';

class PostBloc extends Bloc<PostEvent, PostsPageState> {
  final PostService _postService = PostService();

  PostBloc(PostsPageState initialState) : super(initialState);

  @override
  Stream<PostsPageState> mapEventToState(event) async* {
    if (event is FetchPosts) {
      yield* _mapFetchPostsToState();
    }
  }

  Stream<PostsPageState> _mapFetchPostsToState() async* {
    yield PostsLoading();
    final List<Post> posts = await _postService.getAllPosts();
    yield PostsLoaded(posts: posts);
  }
}
