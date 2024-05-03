import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onBoarding_states.dart';
class OnBoardingCubit extends Cubit<OnBoardingStates>{
  static OnBoardingCubit get(context) => BlocProvider.of(context);
  OnBoardingCubit():super(OnBoardingInitialState()){
    pageController = PageController();
  }
  late PageController pageController;
  int currentIndex = 0;
  void changeCurrentIndex(int index){
    currentIndex = index;
    emit(ChangeDotState());
  }
  void nextPage(){
    currentIndex++;
    pageController.animateToPage(currentIndex, duration: Duration(microseconds: 900), curve: Curves.bounceInOut);
    emit(NextPageState());
  }
}