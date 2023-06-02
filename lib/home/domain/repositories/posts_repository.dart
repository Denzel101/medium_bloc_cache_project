import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:medium_bloc_cache_project/home/home.dart';

class PostsRepository {
  PostsRepository({required Box<PostsResponseModel?> postsBox})
      : _postsBox = postsBox;

  final _client = http.Client();

  final Box<PostsResponseModel?> _postsBox;

  Future<List<PostsResponseModel>> getPosts() async {
    final response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    final json = jsonDecode(response.body) as List<dynamic>;
    final posts = json.map(
      (e) => PostsResponseModel.fromMap(
        Map<String, dynamic>.from(e as Map<String, dynamic>),
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Something went wrong. Try again later');
    }

    return posts.toList();
  }

  Future<void> savePostsLocally({
    required List<PostsResponseModel> posts,
  }) async {
    for (final post in posts) {
      await _postsBox.put(post.id, post);
    }
  }

  Future<List<PostsResponseModel?>> fetchAllLocalPosts() async {
    final localPosts = _postsBox.values.toList();
    return localPosts;
  }
}
