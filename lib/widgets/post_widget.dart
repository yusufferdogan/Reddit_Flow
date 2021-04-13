import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:app_nation_project/models/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(post.description == "");
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        color: Colors.blueGrey[100],
      ),
      child: Column(
        children: [
          Container(
            child: Text(
              post.title + "\n",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "Author: \n",
                  style: TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(post.author + "\n"),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          if (post.thumbnail != null)
            Container(
              child: Image.network(
                post.thumbnail,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
            ),
          if (post.description != "")
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.pink,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                post.description,
                textAlign: TextAlign.center,
              ),
            ),
          // Divider(),
        ],
      ),
    );
  }
}
