import 'package:academy/src/core/domain/entities/course_entity.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/features/lesson_details/lessons_details.dart';
import 'package:academy/src/features/lessons/presentation/pages/lessons_screen.dart';
import 'package:academy/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/features.dart';

class Routes {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static final homeTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'homeTabNavigatorKey');
  static final profileTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'profileTabNavigatorKey');
  static final learningTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'learningTabNavigatorKey');

  static final routes = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
          path: '/lessons-details',
          name: 'lessonDetails',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              transitionDuration: AppTimes().t300,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    const begin = Offset(-1.0, 0.0);
                    const end = Offset.zero;
                    final tween = Tween(begin: begin, end: end);
                    final offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
              child: const LessonDetails(),
            );
          }),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: '/main',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const HomeScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: learningTabNavigatorKey,
            routes: [
              GoRoute(
                path: '/learning',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const LearningScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: profileTabNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const ProfileScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          context,
          state,
          navigationShell,
        ) {
          return getPage(
            child: MainScreen(
              navigationShell: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        path: '/lessons/:name',
        pageBuilder: (context, state) {
          return getPage(
            child: LessonsScreen(
              courseEntity: state.extra as CourseEntity,
            ),
            state: state,
          );
        },
      ),
    ],
  );

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
