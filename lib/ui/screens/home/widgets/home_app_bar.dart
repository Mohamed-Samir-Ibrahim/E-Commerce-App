
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_colors.dart';
import '../../cart/cart_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h,),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.h),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/app_logo.png",
                      alignment: Alignment.topLeft,
                      height: 180.h,
                      width: 180.w,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextField(
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 18.sp),
                  decoration: InputDecoration(
                    hintText: "What do you search for?",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 13.sp),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 30.w,
                      maxWidth: 100.w,
                    ),
                    prefixIcon: ImageIcon(
                      const AssetImage(
                        "assets/images/search_icon.png",
                      ),
                      color: MyColors.primaryColor,
                      size: 15.sp,
                    ),
                    contentPadding: const EdgeInsets.only(top: 0),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: MyColors.primaryColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.r),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: MyColors.primaryColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.r),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: MyColors.primaryColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.r),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 5.w,
              // ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                icon: const ImageIcon(
                  AssetImage(
                    "assets/images/cart_icon.png",
                  ),
                  color: MyColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
