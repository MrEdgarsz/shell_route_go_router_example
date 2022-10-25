import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router_test/go_router.dart';

final StreamController<double> scrollOffsetController = StreamController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
