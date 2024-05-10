

import '../screens/auth/login/login_screen.dart';
import '../screens/auth/register/register_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/product_details/product_details_screen.dart';

class MyRoutes {
  // static String? initialRoute = LoginScreen.routeName;
  static String? initialRoute = HomeScreen.routeName;

  static var myRoutes = {
    LoginScreen.routeName: (_) => const LoginScreen(),
    RegisterScreen.routeName: (_) => const RegisterScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    ProductDetailsScreen.routeName: (_) => const ProductDetailsScreen(),
    CartScreen.routeName: (_) => const CartScreen()
  };
}
