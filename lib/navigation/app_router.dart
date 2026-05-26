import 'package:flutter_lab/lesson_11/homework_11_interactive_screen.dart';
import 'package:flutter_lab/lesson_11/homework_11_screen.dart';
import 'package:flutter_lab/lesson_12/homework_12.dart';
import 'package:flutter_lab/lesson_13/homework_13.dart';
import 'package:flutter_lab/lesson_18/homework_bloc/homework_bloc_screen.dart';
import 'package:flutter_lab/lesson_18/homework_cubit/homework_cubit_screen.dart';
import 'package:flutter_lab/lesson_18/state_management_base_screen.dart';
import 'package:flutter_lab/main.dart';
import 'package:flutter_lab/widgets_main_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String home = 'home';
  static const String widgets = 'widgets';
  static const String hw11 = 'hw11';
  static const String hw11Interactive = 'hw11Interactive';
  static const String hw12 = 'hw12';
  static const String hw13 = 'hw13';
  static const String hw18 = 'hw18';
  static const String cubitExample = 'cubit_example';
  static const String blocExample = 'bloc_example';

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: home,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'widgets',
            name: widgets,
            builder: (context, state) => const WidgetsScreen(),
            routes: [
              GoRoute(
                path: 'hw11',
                name: hw11,
                builder: (context, state) => const HomeworkElevenScreen(),
              ),
              GoRoute(
                path: 'hw11-interactive',
                name: hw11Interactive,
                builder: (context, state) =>
                    const HomeworkElevenInteractiveScreen(),
              ),
              GoRoute(
                path: 'hw12',
                name: hw12,
                builder: (context, state) => const HomeworkTwelveScreen(),
              ),
              GoRoute(
                path: 'hw13',
                name: hw13,
                builder: (context, state) =>
                    const WidgetConstrainsTrainingScreen(),
              ),
              GoRoute(
                path: 'hw18',
                name: hw18,
                builder: (context, state) => const StateManagementBaseScreen(),
                routes: [
                  GoRoute(
                    path: 'cubit',
                    name: cubitExample,
                    builder: (context, state) => const HomeworkCubitScreen(),
                  ),
                  GoRoute(
                    path: 'bloc',
                    name: blocExample,
                    builder: (context, state) => const HomeworkBlocScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
