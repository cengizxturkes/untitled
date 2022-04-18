import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/car.dart';
import '../../../domain/repositories/car_repository.dart';
import 'home_presenter.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(CarRepository _carRepository)
      : _presenter = HomePresenter(_carRepository);

  List<Car>? cars;

  @override
  void onInitState() {
    _presenter.getCars();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getCarsOnNext = (List<Car>? response) {
      cars = response;
      refreshUI();
    };

    _presenter.getCarsOnError = (error) {};
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
