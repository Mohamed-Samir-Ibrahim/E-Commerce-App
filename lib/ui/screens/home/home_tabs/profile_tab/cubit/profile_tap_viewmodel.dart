import 'dart:convert';

import 'package:ecommerce_app/ui/screens/home/home_tabs/profile_tab/cubit/profile_tap_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../../../../data/api/api_constants.dart';
import '../../../../../../data/models_dto/response/user_response_dto.dart';
import '../../../../../utils/my_shared_preferences.dart';

class ProfileTabViewModel extends Cubit<ProfileTabStates> {
  ProfileTabViewModel() : super(ProfileTabInitialState());

  UserModel? userModel;
  Future<void> getUserData() async {
    emit(GetUserDataInitialState());
    Response response = await http.get(
        Uri.parse("https://ecommerce.routemisr.com/api/v1/users"),
        headers:
        {
          //'Authorization' : 'Bearer ${MySharedPreferces.getData(key: ApiConstants.userToken)}',
          "lang" : "en"
        }
    );
    var responseData = jsonDecode(response.body);
    if( responseData['status'] == true )
    {
      print("response is : $responseData");
      userModel = UserModel.fromJson(data: responseData['data']);
      // debugPrint("response is : $responseData");
      emit(GetUserDataSuccessState());
    }
    else
    {
      // print("response is : $responseData");
      emit(FailedToGetUserDataState(error: responseData['message'].toString()));
    }
  }

  static String? currentPassword;
  void changePassword({required String userCurrentPassword,required String newPassword}) async {
    emit(ChangePasswordLoadingState());
    Response response = await http.post(
        Uri.parse("https://ecommerce.routemisr.com/api/v1/users/changeMyPassword"),
        //Uri.parse("https://ecommerce.routemisr.com/api/v1/users/updateMe"),
        //Uri.parse("https://ecommerce.routemisr.com/api/v1/users"),
        headers:
        {
          //'Authorization' : '${MySharedPreferces.getData(key: ApiConstants.userToken)}',
          'lang' : 'en',
        },
        body: {
          'currentPassword' : userCurrentPassword,
          'password' : newPassword,
        }
    );
    var responseDecoded = jsonDecode(response.body);
    if( response.statusCode == 200 )
    {
      if( responseDecoded['status'] == true )
      {
        await MySharedPreferces.insertToCache(key: 'password', value: newPassword);
        currentPassword = await MySharedPreferces.getCacheData(key: "password");
        emit(ChangePasswordSuccessState());
      }
      else
      {
        emit(ChangePasswordWithFailureState(responseDecoded['message']));
      }
    }
    else
    {
      emit(ChangePasswordWithFailureState("something went wrong, try again later"));
    }
  }

  void updateUserData({required String name,required String phone,required String email}) async {
    emit(UpdateUserDataLoadingState());
    try
    {
      Response response = await http.put(Uri.parse("https://ecommerce.routemisr.com/api/v1/users/updateMe"),headers: {
        'Authorization' : '${MySharedPreferces.getData(key: ApiConstants.userToken)}',
        'lang' : 'en',
      },body: {
        'name' : name,
        'email' : email,
        'phone' : phone
      });
      var responseBody = jsonDecode(response.body);
      if( responseBody['status'] == true )
      {
        await getUserData();
        emit(UpdateUserDataSuccessState());
      }
      else
      {
        emit(UpdateUserDataWithFailureState(responseBody['message'].toString()));
      }
    }
    catch(e){
      emit(UpdateUserDataWithFailureState(e.toString()));
    }
  }
}