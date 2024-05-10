// ignore_for_file: must_be_immutable
import 'package:ecommerce_app/ui/screens/auth/login/login_screen.dart';
import 'package:ecommerce_app/ui/screens/home/home_screen.dart';
import 'package:ecommerce_app/ui/screens/home/home_tabs/profile_tab/cubit/profile_tap_viewmodel.dart';
import 'package:ecommerce_app/ui/utils/bloc_observer.dart';
import 'package:ecommerce_app/ui/utils/my_routes.dart';
import 'package:ecommerce_app/ui/utils/my_shared_preferences.dart';
import 'package:ecommerce_app/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/api/api_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreferces.init();
  var userToken = MySharedPreferces.getData(key: ApiConstants.userToken);
  Bloc.observer = MyBlocObserver();
  userToken = await MySharedPreferces.getCacheData(key: 'token');
  ProfileTabViewModel.currentPassword = await MySharedPreferces.getCacheData(key: 'password');
  String appRoute;
   if (userToken == null) {
     appRoute = LoginScreen.routeName;
   } else {
    appRoute = HomeScreen.routeName;
   }
  runApp(BlocProvider(create: (context) => ProfileTabViewModel(), child: ECommerceApp(appRoute: appRoute)));
}

class ECommerceApp extends StatelessWidget {
  String? appRoute;

  ECommerceApp({required this.appRoute, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.myTheme,
        initialRoute: appRoute,
        routes: MyRoutes.myRoutes,
      ),
    );
  }
}
