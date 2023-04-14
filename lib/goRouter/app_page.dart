import 'package:appchat/utils/key_shared.dart';
import 'package:appchat/utils/sharedpreference.dart';
import 'dart:developer';
import 'dart:async';
import 'package:appchat/cubits/cubit/cubit_login_cubit.dart';
import 'package:appchat/goRouter/app_route.dart';
import 'package:appchat/view/bottom_navigation.dart';
import 'package:appchat/view/first_view_login.dart';
import 'package:appchat/view/login_view.dart';
import 'package:appchat/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPage {
  final CubitLoginCubit loginCubit;
  AppPage(this.loginCubit);
  late final GoRouter goRoute = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoute.HOME,
        name: 'home',
        builder: (context, state) => FirstViewLogin(),
      ),
      GoRoute(
        path: AppRoute.VIEWCHAT,
        routes: [
          GoRoute(
            path: "viewfriend/:id",
            builder: (context, state) => BottomNavigation(
              idpage: int.parse(state.params['id']!),
            ),
          ),
        ],
        builder: (context, state) => BottomNavigation(
          idpage: 0,
        ),
      ),
      GoRoute(
          path: AppRoute.LOGIN,
          name: 'login',
          builder: (context, state) => loginView()),
      GoRoute(
          path: AppRoute.VIEWSEARCH,
          name: 'search_friend',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: SearchView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutBack)
                      .animate(animation),
                  child: child,
                );
              },
            );
          }),
    ],
    redirect: ((context, state) async {
      final bool loggedIn = loginCubit.state.status == AuthStatus.authenticated;
      final bool unknown = loginCubit.state.status == AuthStatus.unknown;
      final bool loggingIn = state.subloc == "/login";
      final bool home = state.subloc == "/";
      final currentAccount = sharedPreferences.getString(keyShared.GOOGLEGMAIL);
      // if(state.subloc== AppRoute.VIEWSEARCH){
      //   return AppRoute.VIEWSEARCH;
      // }
      switch (state.subloc) {
        case AppRoute.VIEWSEARCH:
          return AppRoute.VIEWSEARCH;
        case AppRoute.VIEWCHAT + "/viewfriend" + "/1":
          return AppRoute.VIEWCHAT + "/viewfriend" + "/1";
        default:
          break;
      }
      if (home) {
        return AppRoute.LOGIN;
      } else if (!currentAccount.isEmpty) {
        return AppRoute.VIEWCHAT;
      }
      if (!loggedIn) {
        return loggingIn ? "/login" : null;
      }
      if (loggedIn) {
        return AppRoute.VIEWCHAT;
      }
      return null;
    }),
    refreshListenable: GoRouterRefeshStream(loginCubit.stream),
  );
}

class GoRouterRefeshStream extends ChangeNotifier {
  GoRouterRefeshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }
  late final StreamSubscription<dynamic> _subscription;
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
