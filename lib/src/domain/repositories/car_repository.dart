import 'package:flutter/cupertino.dart';
import 'package:untitled/src/domain/entities/car.dart';

abstract class CarRepository {
  Stream<List<Car>> getCars();
}
