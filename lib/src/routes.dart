import 'package:academy/src/core/data/local/shared_pref.dart';
import 'package:academy/src/core/resources/resources.dart';
import 'package:academy/src/di/di_setup.dart';
import 'package:academy/src/features/add/presentation/pages/widgets/upload_video/upload_video.dart';
import 'package:academy/src/features/add/presentation/pages/widgets/video_recorder/video_recorder_widget.dart';
import 'package:academy/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:academy/video_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/screens/auth_screen.dart';
import 'features/features.dart';

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
    // redirect: (context, state) {
    //   print(state.topRoute?.path);
    //
    //   if (!getLoggedIn()) {
    //     if(kIsWeb) return '/auth';
    //     print('going to onboard ' + (state.topRoute?.path ?? '').toString());
    //     return '/';
    //   }
    //   return null;
    // },
    initialLocation: getLoggedIn()? '/main' : kIsWeb? '/auth' : '/',
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
            final videoModel = state.extra as VideoModel;
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
              child: VideoDetails(videoModel: videoModel),
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
                    child: const SearchScreen(),
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
                    child: const AddPage(),
                    state: state,
                  );
                },
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
      // GoRoute(
      //   path: '/lessons/:name',
      //   pageBuilder: (context, state) {
      //     return getPage(
      //       child: LessonsScreen(
      //         courseEntity: state.extra as CourseEntity,
      //       ),
      //       state: state,
      //     );
      //   },
      // ),
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
