import 'package:ecommerce_app/core/constants/color.dart';
import 'package:ecommerce_app/core/utils/onBoarding_list.dart';
import 'package:ecommerce_app/features/onBoarding/view_model/onBoarding_view_model/onBoarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xffffffff),
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: PageView.builder(
                      controller: cubit.pageController,
                      onPageChanged: (value) {
                        cubit.changeCurrentIndex(value);
                      },
                      itemCount: onBoardingList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            Image.asset(
                              onBoardingList[index].image!,
                              height: 300,
                              width: 300,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ...List.generate(
                                        onBoardingList.length,
                                        (index) => AnimatedContainer(
                                          duration: Duration(
                                            microseconds: 150,
                                          ),
                                          margin: EdgeInsets.only(
                                            right: 5,
                                          ),
                                          height: cubit.currentIndex == index
                                              ? 20
                                              : 18,
                                          width: cubit.currentIndex == index
                                              ? 20
                                              : 18,
                                          decoration: BoxDecoration(
                                            color: cubit.currentIndex == index
                                                ? AppColor.darkPink
                                                : AppColor.lightPink,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Text(
                              onBoardingList[index].title!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColor.darkPink,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 35,
                                left: 15,
                                right: 15,
                              ),
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  onBoardingList[index].textBody!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 40,
                                right: 16,
                                left: 16,
                              ),
                              child: Container(
                                width: 347.w,
                                height: 48.h,
                                child: MaterialButton(
                                  color: AppColor.primaryColor,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      14,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (context
                                            .read<OnBoardingCubit>()
                                            .currentIndex <
                                        onBoardingList.length - 1) {
                                      context
                                          .read<OnBoardingCubit>()
                                          .nextPage();
                                    }
                                  },
                                  child: cubit.currentIndex <
                                          onBoardingList.length - 1
                                      ? Text(
                                          'Next',
                                          style: TextStyle(fontSize: 18.sp),
                                        )
                                      : Text(
                                          'Get Started',
                                          style: TextStyle(fontSize: 18.sp),
                                        ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
