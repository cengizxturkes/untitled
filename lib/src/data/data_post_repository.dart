import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:untitled/src/domain/entities/post.dart';
import 'package:http/http.dart' as http;

import '../domain/repositories/post_repository.dart';
//bu datalar ilerleyen zamanda farklı api kaynaklarından sağlanması gerekebilir.
//bu durumlarda kodu bozmadan daha rahat api değişimi gibi şeyleri sağlarız.

class DataPostRepository implements PostRepository {
  StreamController<List<Post>> _streamController = StreamController.broadcast();
  List<Post> posts = [];
  @override
  Future<Stream<List<Post>>> getPosts() async {
    http
        .get(Uri.parse('http://jsonplaceholder.typicode.com/posts'))
        .then((response) async {
      try {
        // var result = await Dio().get('http://jsonplaceholder.typicode.com/posts',
        //     options: Options(responseType: ResponseType.json));

        if (response.statusCode == 200) {
          var result = jsonDecode(response.body);
          for (var item in result) {
            posts.add(
                Post(item["userId"], item["id"], item["title"], item["body"]));

            Future.delayed(Duration(seconds: 10))
                .then((_) => _streamController.add(posts));
          }
        }
      } catch (e) {
        _streamController.addError(e);
      }
    });

    return _streamController.stream;
  }

  @override
  Future<Stream<Post>> getPostsById(int id) {
    // TODO: implement getPostsById
    throw UnimplementedError();
  }
}
