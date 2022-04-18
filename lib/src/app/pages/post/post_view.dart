import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:untitled/src/app/pages/post/post_controller.dart';

import '../../../data/data_post_repository.dart';
import '../../../domain/repositories/post_repository.dart';

class PostPage extends View {
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _PostPageState(PostController(DataPostRepository()));
  }
}

class _PostPageState extends ViewState<PostPage, PostController> {
  _PostPageState(PostController controller) : super(controller);

  @override
  // TODO: implement view
  Widget get view => Scaffold(
        body: ControlledWidgetBuilder<PostController>(
          builder: (BuildContext context, PostController controller) {
            if (controller.isError) {
              return Center(child: Text(controller.errMessage));
            }
            if (controller.posts.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                var post = controller.getByIndex(index);
                return ListTile(
                    title: Text(
                      post.title,
                    ),
                    subtitle: Text(post.body));
              },
              itemCount: controller.posts.length,
            );
          },
        ),
      );
}
