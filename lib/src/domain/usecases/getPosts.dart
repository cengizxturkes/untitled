import 'dart:async';

import 'package:untitled/src/domain/entities/post.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:untitled/src/domain/repositories/post_repository.dart';

class GetPosts extends UseCase<List<Post>, int> {
  PostRepository repository;
  final StreamController<List<Post>> _controller;
  GetPosts(this.repository) : _controller = StreamController.broadcast();

  @override
  Future<Stream<List<Post>?>> buildUseCaseStream(int? params) async {
    repository.getPosts().then(
          (value) => {
            value.listen(
              (event) {
                _controller.add(event);
              },
            )
          },
        );
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
