import 'package:app_nation_project/blocs/post_bloc/bloc.dart';
import 'package:app_nation_project/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostBloc(PostsInitState())..add(FetchPosts()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Reedit Posts',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: PostPage()),
    );
  }
}
