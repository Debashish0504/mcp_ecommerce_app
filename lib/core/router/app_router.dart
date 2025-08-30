import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mcp_ecommerce_app/core/router/shell_route.dart';
import 'package:mcp_ecommerce_app/features/auth/presentation/pages/login_page.dart';
import 'package:mcp_ecommerce_app/features/auth/presentation/pages/signup_page.dart';
import 'package:mcp_ecommerce_app/features/home/presentation/pages/home_page.dart';
import 'package:mcp_ecommerce_app/features/catalog/presentation/pages/catalog_page.dart';
import 'package:mcp_ecommerce_app/features/catalog/presentation/pages/product_detail_page.dart';
import 'package:mcp_ecommerce_app/features/search/presentation/pages/search_page.dart';
import 'package:mcp_ecommerce_app/features/stores/presentation/pages/stores_page.dart';
import 'package:mcp_ecommerce_app/features/scan/presentation/pages/scan_page.dart';
import 'package:mcp_ecommerce_app/features/profile/presentation/pages/profile_page.dart';
import 'package:mcp_ecommerce_app/features/notifications/presentation/pages/notifications_page.dart';
import 'package:mcp_ecommerce_app/features/brands/presentation/pages/all_brands_page.dart';
import 'package:mcp_ecommerce_app/features/brands/presentation/pages/brand_profile_page.dart';
import 'package:mcp_ecommerce_app/features/feed/presentation/pages/friends_page.dart';
import 'package:mcp_ecommerce_app/features/feed/presentation/pages/article_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      // Auth routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),
      
      // Main app shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/catalog',
            name: 'catalog',
            builder: (context, state) => const CatalogPage(),
            routes: [
              GoRoute(
                path: 'product/:productId',
                name: 'product-detail',
                builder: (context, state) {
                  final productId = state.pathParameters['productId']!;
                  return ProductDetailPage(productId: productId);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
            path: '/stores',
            name: 'stores',
            builder: (context, state) => const StoresPage(),
          ),
          GoRoute(
            path: '/scan',
            name: 'scan',
            builder: (context, state) => const ScanPage(),
          ),
        ],
      ),
      
      // Other routes outside bottom nav
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/brands',
        name: 'all-brands',
        builder: (context, state) => const AllBrandsPage(),
        routes: [
          GoRoute(
            path: ':brandId',
            name: 'brand-profile',
            builder: (context, state) {
              final brandId = state.pathParameters['brandId']!;
              return BrandProfilePage(brandId: brandId);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/friends',
        name: 'friends',
        builder: (context, state) => const FriendsPage(),
      ),
      GoRoute(
        path: '/article/:articleId',
        name: 'article',
        builder: (context, state) {
          final articleId = state.pathParameters['articleId']!;
          return ArticlePage(articleId: articleId);
        },
      ),
    ],
  );
});
