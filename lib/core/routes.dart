import 'package:flutter_advanced_dev/screens/client/login.dart';
import 'package:flutter_advanced_dev/screens/client/profile.dart';
import 'package:flutter_advanced_dev/screens/client/register.dart';
import 'package:flutter_advanced_dev/screens/core/error.dart';
import 'package:flutter_advanced_dev/screens/product/card.dart';
import 'package:flutter_advanced_dev/screens/product/favorites.dart';
import 'package:flutter_advanced_dev/screens/product/product.dart';
import 'package:flutter_advanced_dev/screens/static/boarding.dart';
import 'package:go_router/go_router.dart';
import '../screens/core/loader.dart';
import '../screens/home.dart';
import '../screens/product/products.dart';
import '../screens/product/search.dart';

// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => const ProductScreen(),
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/card',
      builder: (context, state) => const CardScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);
