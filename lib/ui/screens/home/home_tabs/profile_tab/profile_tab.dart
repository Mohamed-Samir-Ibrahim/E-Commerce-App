// ignore_for_file: use_build_context_synchronously
import 'package:ecommerce_app/ui/screens/home/home_tabs/profile_tab/update_user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/api/api_constants.dart';
import '../../../../utils/my_colors.dart';
import '../../../../utils/my_shared_preferences.dart';
import '../../../../widgets/auth_textform_field.dart';
import '../../../../widgets/dialog_util.dart';
import '../../../auth/login/login_screen.dart';
import 'change_password_screen.dart';
import 'cubit/profile_tap_states.dart';
import 'cubit/profile_tap_viewmodel.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileTabViewModel,ProfileTabStates>(
      listener: (context,state) {
        if( state is UpdateUserDataSuccessState )
        {
          showSnackBarItem(context, "Data Updated Successfully", true);
        }
        if( state is UpdateUserDataWithFailureState )
        {
          showSnackBarItem(context, state.error, false);
        }
      },
      builder:(context, state) {
        final cubit = BlocProvider.of<ProfileTabViewModel>(context);
        if( cubit.userModel == null ) cubit.getUserData();
        return Scaffold(
          body: cubit.userModel != null ?
           Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/app_bar_logo.png'),
                      IconButton(
                          onPressed: () {
                            DialogUtils.showMessage(
                              context,
                              title: "Sign Out",
                              content: "Do you really want to sign out?",
                              negActionName: "Yes",
                              negAction: () async {
                                DialogUtils.showLoading(context,
                                    message: "Loading...");
                                MySharedPreferces.deleteData(
                                    key: ApiConstants.userToken);
                                await Future.delayed(Durations.long2);
                                DialogUtils.hideLoading(context);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  LoginScreen.routeName,
                                      (Route<dynamic> route) => false,
                                );
                              },
                              posActionName: "Cancel",
                              posAction: () {},
                            );
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: MyColors.primaryColor,
                          ))
                    ],
                  ),
                  AuthTextFormField(
                    fieldTitleStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: MyColors.primaryColor),
          
                    // controller: _viewModel.userNameController,
                    fieldTitle: "Your Full Name",
                    hintText: cubit.userModel!.name!,
                  ),
                  AuthTextFormField(
                    fieldTitleStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: MyColors.primaryColor),
          
                    // controller: _viewModel.userPhoneNoController,
                    fieldTitle: "Your Mobile Number",
                    hintText: cubit.userModel!.phone!,
                  ),
                  AuthTextFormField(
                    fieldTitleStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: MyColors.primaryColor),
          
                    // controller: _viewModel.userEmailController,
                    fieldTitle: "E-mail address",
                    hintText: cubit.userModel!.email!,
                  ),
                  MaterialButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen()));
                    },
                    color: MyColors.primaryColor,
                    textColor: MyColors.whiteColor,
                    child: const Text("Update Password"),
                  ),
                  const SizedBox(height: 15,),
                  MaterialButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserDataScreen()));
                    },
                    color: MyColors.primaryColor,
                    textColor: MyColors.whiteColor,
                    child: const Text("Update Data"),
                  )
                ],
              ),
            ),
          ):const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
  void showSnackBarItem(BuildContext context,String message,bool forSuccessOrFailure){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message),backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,));
  }
}
