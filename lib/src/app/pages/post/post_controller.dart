import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:untitled/src/app/pages/post/post_presenter.dart';

import '../../../domain/entities/post.dart';
import '../../../domain/repositories/post_repository.dart';

class PostController extends Controller {
  final PostRepository repository;
  PostPresenter presenter;
  List<Post> posts = [];
  bool isError = false;
  String errMessage = "";
  PostController(this.repository) : presenter = PostPresenter(repository);
  @override
  void initListeners() {
    presenter.getPostsOnNext = (List<Post> values) {
      posts = values;
      isError = false;
      refreshUI();
    };
    presenter.getPostsOnError = (e) {
      isError = true;
      errMessage = e.toString();
      print(e);
    };
  }

  @override
  void dispose() {
    presenter.dispose();
  }

  @override
  void onInitState() {
    super.onInitState();
    presenter.getPosts();
  }

  Post getByIndex(int index) => posts[index];
}
