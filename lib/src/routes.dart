import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/add/presentation/pages/add_video_page.dart';
import 'package:academy/src/features/add/presentation/pages/widgets/upload_video/upload_video.dart';
import 'package:academy/src/features/add/presentation/pages/widgets/video_recorder/video_recorder_widget.dart';
import 'package:academy/src/features/favourite/domain/entity/content/response/content_response_entity.dart';
import 'package:academy/src/features/favourite/presentation/favourite_page.dart';
import 'package:academy/src/features/new_content/presentation/pages/new_content_page.dart';
import 'package:academy/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:academy/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/screens/auth_screen.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/main/presentation/screens/main_screen.dart';
import 'features/search/presentation/pages/search_page.dart';
import 'features/video_details/presentation/pages/video_details_page.dart';

class Routes {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static final homeTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'homeTabNavigatorKey');
  static final searchTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'searchTabNavigatorKey');
  static final addTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'addTabNavigatorKey');
  static final savedTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'savedTabNavigatorKey');
  static final profileTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'profileTabNavigatorKey');

  static final routes = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: getLoggedIn()
        ? '/main'
        : kIsWeb
            ? '/auth'
            : '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: UploadVideo.uploadVideoPageName,
        name: UploadVideo.uploadVideoPageName,
        builder: (context, state) => const UploadVideo(),
      ),
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SplashScreen(),
      // ),
      GoRoute(
        path: '/video-recorder',
        builder: (context, state) => const VideoRecorderWidget(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
          path: '/video-details',
          name: 'videoDetails',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final videoModel = state.extra as ContentResponseEntity;
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
              child: VideoDetails(entity: videoModel),
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
                    child: const HomePage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: searchTabNavigatorKey,
            routes: [
              GoRoute(
                path: '/search',
                pageBuilder: (context, state) {
                  return getPage(
                    child: SearchScreen(extra: state.extra as Map<String,dynamic>?),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: addTabNavigatorKey,
            routes: [
              GoRoute(
                path: '/add',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const NewContentPage(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'addVideo',
                    pageBuilder: (context, state) {
                      return getPage(
                        child: const AddVideoPage(),
                        state: state,
                      );
                    },
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: savedTabNavigatorKey,
            routes: [
              GoRoute(
                path: '/favourite',
                pageBuilder: (context, state) {
                  return getPage(
                    child: const FavouritePage(),
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

bool getLoggedIn() {
  return getIt<Storage>().getLoggedIn();
}

void setLoggedIn() {
  getIt<Storage>().setLoggedIn(true);
}
