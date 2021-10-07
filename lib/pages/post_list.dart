import 'package:app_test/models/post.models.dart';
import 'package:app_test/services/post.service.dart';
import 'package:flutter/material.dart';

Widget postList() {
  return FutureBuilder<List<Post>>(
    future: getAllPosts(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        List<Post>? posts = snapshot.data;
        return ListView.builder(
          itemCount: posts!.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Card(
              child: Row(
                mainAxisSize: MainAxisSize.max,

              ),
            ),
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
