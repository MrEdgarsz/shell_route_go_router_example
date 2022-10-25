import 'package:flutter/material.dart';
import '../main.dart';

class FirstPage extends StatelessWidget {
  final ScrollController scrollController = ScrollController();
  FirstPage({super.key}) {
    scrollController.addListener(() {
      scrollOffsetController.add(scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: Colors.white,
            child: Center(
              child: Text("Item $index"),
            ),
          );
        },
      ),
    );
  }
}
