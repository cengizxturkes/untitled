import 'dart:async';

import 'package:untitled/src/domain/repositories/car_repository.dart';

import '../entities/car.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetCars extends UseCase<List<Car>, void> {
  final CarRepository _carRepository;
  final StreamController<List<Car>> _controller;
  GetCars(this._carRepository) : _controller = StreamController.broadcast();
  @override
  Future<Stream<List<Car>?>> buildUseCaseStream(void params) async {
    try {
      _carRepository.getCars().listen((List<Car> cars) {
        if (!_controller.isClosed) {
          _controller.add(cars);
        }
      });
    } catch (e, st) {
      print(e);
      print(st);
      _controller.addError(e, st);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
