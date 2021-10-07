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
            Post post = posts[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.fromLTRB(6, 16, 6, 0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(
                      Icons.access_alarm_rounded,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(post.title),
                    )
                  ],
                ),
              ),
            );
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
