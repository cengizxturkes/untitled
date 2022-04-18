import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:untitled/src/app/pages/home/home_controller.dart';
import '../../../data/data_car_repository.dart';

class HomeView extends View {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState(HomeController(DataCarRepository()));
  }
}

class _HomeViewState extends ViewState<HomeView, HomeController> {
  _HomeViewState(HomeController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ControlledWidgetBuilder<HomeController>(
                builder: (context, controller) {
                  return Column(
                    children: [
                      controller.cars != null && controller.cars!.isNotEmpty
                          ? Text(
                              controller.cars!.first.modelYear,
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
