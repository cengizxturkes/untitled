import 'dart:async';

import 'package:untitled/src/domain/entities/car.dart';
import 'package:untitled/src/domain/repositories/car_repository.dart';

class DataCarRepository implements CarRepository {
  StreamController<List<Car>> _streamController = StreamController.broadcast();
  List<Car> _cars = [Car("brand", "id", "modelYear")];
  @override
  Stream<List<Car>> getCars() {
    Future.delayed(Duration.zero).then((_) => _streamController.add(_cars));
    return _streamController.stream;
  }
}
