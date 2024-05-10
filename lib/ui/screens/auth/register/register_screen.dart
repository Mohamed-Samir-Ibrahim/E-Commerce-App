import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/dep_injections.dart';
import '../../../utils/my_colors.dart';
import '../../../widgets/auth_button.dart';
import '../../../widgets/auth_textform_field.dart';
import '../../../widgets/dialog_util.dart';
import '../../home/home_screen.dart';
import '../login/login_screen.dart';
import 'cubit/register_screen_states.dart';
import 'cubit/register_screen_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register_screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _viewModel =
      RegisterScreenViewModel(registerUseCase: injectRegisterUseCase());
  bool _isPasswordSecured = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _viewModel,
        listener: (contex, state) {
          if (state is LoadingState) {
            DialogUtils.showLoading(context, message: "Loading...");
          } else if (state is ErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context,
                title: "Error", content: state.errorMessage ?? "");
          } else if (state is SuccessState) {
            DialogUtils.hideLoading(context);
            // DialogUtils.showMessage(context,
            //     title: "Register Successeded",
            //     content: state.registerResponseEntitiy?.user?.name ?? "");
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        },
        child: Scaffold(
          backgroundColor: MyColors.whiteColor,
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Form(
                key: _viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 95.h, right: 96.h, left: 96.h),
                      child: Image.asset('assets/images/app_logo.png'),
                    ),
                    AuthTextFormField(
                      controller: _viewModel.userNameController,
                      fieldTitle: "Full Name",
                      hintText: "enter your full name",
                    ),
                    AuthTextFormField(
                      controller: _viewModel.userPhoneNoController,
                      fieldTitle: "Mobile Number",
                      hintText: "enter your mobile no.",
                    ),
                    AuthTextFormField(
                      controller: _viewModel.userEmailController,
                      fieldTitle: "E-mail address",
                      hintText: "enter your email address",
                    ),
                    AuthTextFormField(
                      controller: _viewModel.uesrPasswordController,
                      fieldTitle: "Password",
                      hintText: "enter your password",
                      obscureText: _isPasswordSecured,
                      suffixIcon: IconButton(
                          icon: (_isPasswordSecured)
                              ? const ImageIcon(AssetImage(
                                  'assets/images/eye_slash_icon.png'))
                              : const ImageIcon(
                                  AssetImage('assets/images/eye_icon.png')),
                          onPressed: () {
                            setState(() {
                              _isPasswordSecured = !_isPasswordSecured;
                            });
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
                      child: AuthButton(
                          title: "Sign Up",
                          onPressed: () {
                            _viewModel.register();
                          }),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 30.w,),
                        Text(
                          "Already have an account",
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .titleMedium
                          //     ?.copyWith(fontSize: 17),
                          // textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17.sp,color: Colors.black,),
                        ),
                        SizedBox(width: 10.w,),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                          child: Text(
                            "Login",
                            // style: Theme.of(context)
                            //     .textTheme
                            //     .titleMedium
                            //     ?.copyWith(fontSize: 17),
                            // textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17.sp,color: MyColors.primaryColor,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
