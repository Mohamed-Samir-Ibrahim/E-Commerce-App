import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home_tabs/home_tab/home_tab.dart';
import '../home_tabs/products_tab/products_tab.dart';
import '../home_tabs/profile_tab/profile_tab.dart';
import '../home_tabs/wishlist_tab/wishlist_tab.dart';
import 'home_screen_states.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductsTab(),
    WishListTab(),
    ProfileTab(),
  ];
  void changeTab(newIndex) {
    // emit(HomeScreenInitialState());
    selectedIndex = newIndex;
    emit(HomeScreenChangingTabState());
  }
}
