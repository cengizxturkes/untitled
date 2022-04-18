import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/post.dart';
import '../../../domain/repositories/post_repository.dart';
import '../../../domain/usecases/getPosts.dart';

class PostPresenter extends Presenter {
  late Function getPostsOnNext;
  late Function getPostsOnError;
  final GetPosts _getPosts;

  PostPresenter(PostRepository _postRepository)
      : _getPosts = GetPosts(_postRepository);

  @override
  void dispose() {}
  void getPosts() {
    _getPosts.execute(_GetPostsObserver(this));
  }
}

class _GetPostsObserver extends Observer<List<Post>> {
  final PostPresenter _presenter;
  _GetPostsObserver(this._presenter);
  @override
  void onComplete() {}
  @override
  void onError(e) {
    _presenter.getPostsOnError(e);
  }

  @override
  void onNext(List<Post>? response) {
    _presenter.getPostsOnNext(response);
  }
}
