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
                path: ':hwId',
                builder: (context, state) {
                  final hwId = state.pathParameters['hwId'];

                  switch (hwId) {
                    case 'hw11':
                      return const HomeworkElevenScreen();
                    case 'hw11-interactive':
                      return const HomeworkElevenInteractiveScreen();
                    case 'hw12':
                      return const HomeworkTwelveScreen();
                    case 'hw13':
                      return const WidgetConstrainsTrainingScreen();
                    default:
                      return const WidgetsScreen();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
