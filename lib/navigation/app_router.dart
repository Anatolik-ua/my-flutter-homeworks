import 'package:go_router/go_router.dart';
import 'package:flutter_lab/lesson_11/homework_11_interactive_screen.dart';
import 'package:flutter_lab/lesson_11/homework_11_screen.dart';
import 'package:flutter_lab/lesson_12/homework_12.dart';
import 'package:flutter_lab/lesson_13/homework_13.dart';
import 'package:flutter_lab/main.dart';
import 'package:flutter_lab/widgets_main_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/widgets',
        builder: (context, state) => const WidgetsScreen(),
      ),
    ],
  );
}
