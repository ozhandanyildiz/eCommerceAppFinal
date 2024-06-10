import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/screens/client/login.dart';
import 'package:flutter_advanced_dev/screens/client/profile.dart';
import 'package:flutter_advanced_dev/screens/client/register.dart';
import 'package:flutter_advanced_dev/screens/core/error.dart';
import 'package:flutter_advanced_dev/screens/product/card.dart';
import 'package:flutter_advanced_dev/screens/product/favorites.dart';
import 'package:flutter_advanced_dev/screens/product/product.dart';
import 'package:flutter_advanced_dev/screens/splash.dart';
import 'package:flutter_advanced_dev/screens/static/boarding.dart';
import 'package:flutter_advanced_dev/screens/static/holder.dart';
import 'package:go_router/go_router.dart';
import '../screens/core/loader.dart';
import '../screens/home.dart';
import '../screens/product/products.dart';
import '../screens/product/search.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => HolderScreen(
              child: child,
            ),
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SplashScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/loader',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LoaderScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/login',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LoginScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/register',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: RegisterScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfileScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/product',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProductScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/products',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProductsScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/favorites',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: FavoritesScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/card',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CardScreen()),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: '/search',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SearchScreen()),
          ),
        ]),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
