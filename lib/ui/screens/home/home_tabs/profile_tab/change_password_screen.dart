import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/my_colors.dart';
import 'cubit/profile_tap_states.dart';
import 'package:flutter/material.dart';

import 'cubit/profile_tap_viewmodel.dart';
class ChangePasswordScreen extends StatelessWidget {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileTabViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Password"),
        backgroundColor: MyColors.primaryColor,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:
          [
            TextField(
              controller: currentPasswordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Current Password"
              ),
            ),
            SizedBox(height: 16,),
            TextField(
              controller: newPasswordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "New Password"
              ),
            ),
            SizedBox(height: 24,),
            BlocConsumer<ProfileTabViewModel,ProfileTabStates>(
                listener: (context,state){
                  if( state is ChangePasswordSuccessState )
                  {
                    showSnackBarItem(context, "Password Updated Successfully", true);
                    Navigator.pop(context);
                  }
                  if( state is ChangePasswordWithFailureState )
                  {
                    showSnackBarItem(context, state.error, false);
                  }
                },
                builder: (context,state)
                {
                  return MaterialButton(
                    onPressed: ()
                    {
                      debugPrint("From TextField : ${currentPasswordController.text} , current : ${ProfileTabViewModel.currentPassword}");
                      if( currentPasswordController.text == ProfileTabViewModel.currentPassword )
                      {
                        if( newPasswordController.text.length >= 6 )
                        {
                          cubit.changePassword(userCurrentPassword: ProfileTabViewModel.currentPassword!, newPassword: newPasswordController.text.trim());
                        }
                        else
                        {
                          showSnackBarItem(context,"Password must be at least 6 characters",false);
                        }
                      }
                      else
                      {
                        showSnackBarItem(context,"please, verify current password, try again later",false);
                      }
                    },
                    color: MyColors.primaryColor,
                    height: 45,
                    minWidth: double.infinity,
                    textColor: Colors.white,
                    child: Text(state is ChangePasswordLoadingState ? "Loading..." : "Update"),
                  );
                }
            )
          ],
        ),
      ),
    );
  }

  void showSnackBarItem(BuildContext context,String message,bool forSuccessOrFailure){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message),backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,));
  }
}