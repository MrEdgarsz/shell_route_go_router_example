import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_test/app_scaffold.dart';
import 'package:go_router_test/notifications_listener.dart';
import 'package:go_router_test/pages/first_page.dart';
import 'package:go_router_test/pages/second_page.dart';
import 'package:go_router_test/pages/third_page.dart';

final homeNavigatorKey = GlobalKey<NavigatorState>();
final notificationNavigatorKey = GlobalKey<NavigatorState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: "/second/third",
  routes: [
    ShellRoute(
      navigatorKey: notificationNavigatorKey,
      builder: (context, state, child) =>
          TestNotificationListener(child: child),
      routes: [
        ShellRoute(
          navigatorKey: homeNavigatorKey,
          builder: (context, state, child) {
            return AppScaffold(child: child);
          },
          routes: [
            GoRoute(
              path: "/",
              builder: (context, state) => FirstPage(),
            ),
            GoRoute(
              path: "/second",
              builder: (context, state) => const SecondPage(),
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: "third",
                  builder: (context, state) => const ThirdPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    )
  ],
);
