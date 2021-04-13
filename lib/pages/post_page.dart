import 'package:app_nation_project/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_nation_project/blocs/post_bloc/bloc.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostsPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Post Page'),
          ),
          body: _buildBody(state),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _buildBody(PostsPageState state) {
    if (state is PostsInitState || state is PostsLoading) {
      return Center(child: CircularProgressIndicator());
    } else {
      final post = (state as PostsLoaded).posts;
      return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration.zero).then(
              (value) => BlocProvider.of<PostBloc>(context).add(FetchPosts()));
        },
        child: Container(
          child: ListView.builder(
            itemCount: post.length,
            itemBuilder: (context, index) {
              return PostWidget(
                post: post[index],
              );
            },
          ),
        ),
      );
    }
  }
}
