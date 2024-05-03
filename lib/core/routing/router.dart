import 'package:ecommerce_app/core/constants/string.dart';
import 'package:ecommerce_app/features/onBoarding/view/on_boarding.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch(settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) => OnBoarding(),);
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(body: Center(child: Text('No Route ${settings.name}',),),),);
    }
  }
}