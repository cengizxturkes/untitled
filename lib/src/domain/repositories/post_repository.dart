import '../entities/post.dart';

abstract class PostRepository {
  Future<Stream<List<Post>>> getPosts();
  Future<Stream<Post>> getPostsById(int id);
}
