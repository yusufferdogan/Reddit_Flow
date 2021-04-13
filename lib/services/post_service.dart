import 'dart:convert';

import 'package:app_nation_project/models/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  static final PostService _postService = PostService._internal();

  PostService._internal();

  factory PostService() {
    return _postService;
  }

  Future<List<Post>> getAllPosts() async {
    print("getAllPosts");
    var url = "https://www.reddit.com/r/flutterdev/top.json?count=20";
    final List<Post> loadedPosts = [];
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('? ${response.statusCode}');
        var extractedData = jsonDecode(response.body) as Map<String, dynamic>;
        final x = extractedData['data']['children'] as List<dynamic>;
        print('len: ${x.length}');
        for (int i = 0; i < x.length; i++) {
          print(x[i]['data']['selftext']);
          print(i);
          final post = Post.fromJson(
              i.toString(), x[i]['data'], x[i]['data']['thumbnail']);
          loadedPosts.add(post);
        }
        for (int i = 0; i < x.length; i++) {
          print(loadedPosts[i].toString());
        }
      } else {
        print('error ${response.statusCode}');
      }
    } catch (e) {} finally {}
    return loadedPosts;
  }
}
