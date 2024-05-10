import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/dep_injections.dart';
import '../../../utils/my_colors.dart';
import '../../../widgets/auth_button.dart';
import '../../../widgets/auth_textform_field.dart';
import '../../../widgets/dialog_util.dart';
import '../../home/home_screen.dart';
import '../register/cubit/register_screen_states.dart';
import '../register/register_screen.dart';
import 'cubit/login_screen_view_model.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _viewModel = LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _viewModel,
      listener: (context, state) {
        if (state is LoadingState) {
          DialogUtils.showLoading(context, message: "Loading...");
        } else if (state is ErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context,
              title: "Error", content: state.errorMessage ?? "");
        } else if (state is SuccessState) {
          DialogUtils.hideLoading(context);
          // DialogUtils.showMessage(context,
          //     title: "Login Successeded",
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
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Back To Route",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 24),
                        ),
                        Text(
                          "Please sign in with your mail",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: MyColors.whiteColor),
                        )
                      ],
                    ),
                  ),
                  AuthTextFormField(
                    controller: _viewModel.userEmailController,
                    fieldTitle: "E-mail",
                    hintText: "enter your email address",
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: AuthTextFormField(
                      controller: _viewModel.uesrPasswordController,
                      fieldTitle: "Password",
                      hintText: "enter your password",
                      obscureText: _viewModel.isPasswordSecured,
                      suffixIcon: IconButton(
                          icon: (_viewModel.isPasswordSecured)
                              ? const ImageIcon(AssetImage(
                                  'assets/images/eye_slash_icon.png'))
                              : const ImageIcon(
                                  AssetImage('assets/images/eye_icon.png')),
                          onPressed: () {
                            setState(() {
                              _viewModel.isPasswordSecured =
                                  !_viewModel.isPasswordSecured;
                            });
                          }),
                    ),
                  ),
                  InkWell(
                    overlayColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    onTap: () {},
                    child: Text(
                      "Forget Password",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.h, bottom: 30.h),
                    child: AuthButton(
                        title: "Login",
                        onPressed: () {
                          _viewModel.login();
                        }),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10.w,),
                      Text(
                        "Don't have an account?",
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
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                        child: Text(
                          "Create Account",
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
      ),
    );
  }
}
