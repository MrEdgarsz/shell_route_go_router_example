import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatefulWidget {
  final Widget child;
  const AppScaffold({super.key, required this.child});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "First Page",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Second Page",
          ),
        ],
        onTap: (value) {
          if (value == 0) {
            context.go("/");
          } else if (value == 1) {
            context.go("/second");
          }
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
