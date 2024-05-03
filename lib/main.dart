import 'package:ecommerce_app/core/constants/string.dart';
import 'package:ecommerce_app/core/routing/router.dart';
import 'package:ecommerce_app/features/onBoarding/view_model/onBoarding_view_model/onBoarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(RepositoryProvider(child:
  MyApp(appRouter: AppRouter(),), create: (BuildContext context) => OnBoardingCubit(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.onBoarding,
      ),
    );
  }
}
