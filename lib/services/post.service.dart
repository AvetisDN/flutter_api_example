import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:app_test/models/post.models.dart';
import 'dart:io';

String url = 'https://jsonplaceholder.typicode.com/posts';

Future<List<Post>> getAllPosts() async {
  final response = await http.get(Uri.parse(url));
  return allPostsFromJson(response.body);
}

Future<Post> getPost() async {
  final response = await http.get(Uri.parse('$url/1'));
  return postFromJson(response.body);
}

Future<http.Response> createPost(Post post) async {
  final response = await http.post(Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: ''
      },
      body: postToJson(post));
  return response;
}
