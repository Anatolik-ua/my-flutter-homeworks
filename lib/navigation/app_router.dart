import 'package:flutter_lab/lesson_11/homework_11_interactive_screen.dart';
import 'package:flutter_lab/lesson_11/homework_11_screen.dart';
import 'package:flutter_lab/lesson_12/homework_12.dart';
import 'package:flutter_lab/lesson_13/homework_13.dart';
import 'package:flutter_lab/main.dart';
import 'package:flutter_lab/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'widgets',
            builder: (context, state) => const WidgetsScreen(),
            routes: [
              GoRoute(
                path: 'hw11', // адреса /widgets/hw11
                builder: (context, state) => const HomeworkElevenScreen(),
              ),
              GoRoute(
                path: 'hw11-interactive',
                builder: (context, state) =>
                    const HomeworkElevenInteractiveScreen(),
              ),
              GoRoute(
                path: 'hw12',
                builder: (context, state) => const HomeworkTwelveScreen(),
              ),
              GoRoute(
                path: 'hw13',
                builder: (context, state) =>
                    const WidgetConstrainsTrainingScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
