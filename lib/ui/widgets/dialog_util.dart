import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/my_colors.dart';

class DialogUtils {
  static void showLoading(BuildContext context, {required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: MyColors.primaryColor,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              message,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 17.sp, color: MyColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context,
      {required String? title,
      required String content,
      String? posActionName,
      TextStyle? posActionNameStyle,
      Function? posAction,
      String? negActionName,
      Function? negAction,
      TextStyle? negActionNameStyle}) {
    List<Widget> actions = [];

    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call(); // excute the [posAction] if it != null
          },
          child: Text(
            posActionName,
            style: posActionNameStyle,
          )));
      if (negActionName != null) {
        actions.add(TextButton(
            onPressed: () {
              Navigator.pop(context);
              negAction?.call(); // excute the [negAction] if it != null
            },
            child: Text(
              negActionName,
              style: negActionNameStyle,
            )));
      }
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title ?? "",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 20.sp, color: MyColors.primaryColor),
        ),
        content: Text(
          content,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: actions,
      ),
    );
  }
}
