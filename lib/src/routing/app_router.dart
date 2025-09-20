import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tododuo/src/features/authentication/presentation/providers/auth_state_notifier.dart';
import 'package:tododuo/src/features/authentication/presentation/screens/buyer_home_screen.dart';
import 'package:tododuo/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:tododuo/src/features/authentication/presentation/screens/seller_dispatch_home_screen.dart';
import 'package:tododuo/src/features/authentication/presentation/screens/seller_goods_home_screen.dart';
import 'package:tododuo/src/features/authentication/presentation/screens/signup_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      final user = authState.asData?.value;
      final location = state.uri.toString();

      if (user == null) {
        if (location == '/signup') {
          return '/signup';
        }
        return '/';
      }

      final idTokenResult = await user.getIdTokenResult(true);
      final role = idTokenResult.claims?['role'] as String?;

      if (location == '/' || location == '/signup') {
        switch (role) {
          case 'buyer':
            return '/buyer-home';
          case 'seller_goods':
            return '/seller-goods-home';
          case 'seller_dispatch':
            return '/seller-dispatch-home';
          default:
            return '/'; // Or a default 'unknown role' screen
        }
      }

      return null; // No redirect needed
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/buyer-home',
        builder: (context, state) => const BuyerHomeScreen(),
      ),
      GoRoute(
        path: '/seller-goods-home',
        builder: (context, state) => const SellerGoodsHomeScreen(),
      ),
      GoRoute(
        path: '/seller-dispatch-home',
        builder: (context, state) => const SellerDispatchHomeScreen(),
      ),
    ],
  );
});
