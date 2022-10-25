import 'package:flutter/material.dart';
import 'package:go_router_test/main.dart';

class TestNotificationListener extends StatefulWidget {
  final Widget child;

  const TestNotificationListener({super.key, required this.child});

  @override
  State<TestNotificationListener> createState() =>
      _TestNotificationListenerState();
}

class _TestNotificationListenerState extends State<TestNotificationListener> {
  final collapsedHeight = 50.0;
  final expandedHeight = 100.0;
  double currentHeight = 0;

  @override
  void initState() {
    currentHeight = expandedHeight;
    scrollOffsetController.stream.listen((event) {
      setState(() {
        currentHeight =
            (expandedHeight - event).clamp(collapsedHeight, expandedHeight);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: currentHeight,
            color: Colors.orange,
            child: const Center(
              child: Text("Top"),
            ),
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
