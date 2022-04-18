import 'package:flutter/material.dart';
import 'package:untitled/src/app/pages/home/home_view.dart';

void main() {
  runApp(MaterialApp(home: const MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
