import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gatekeeper/Constants/constants.dart';
import 'package:gatekeeper/Routes/set_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Model/User.dart';

class LoginController extends GetxController {
  var isHidden = false;
  var isLoading = false;

  TextEditingController userCnicController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  Future loginApi(String cnic, String password) async {
    print("Login Api  Functions Hits ! ");

    print("=========");
    print(cnic);
    print(password);
    print("=========");

    isLoading = true;
    update();

    try {
      final response = await Http.post(
        Uri.parse(Api.login),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'cnic': cnic,
          'password': password,
        }),
      );
      print("Login Api Hits Successfully !");
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['data']['roleid'] == 4) {
        final User user = User(
            userid: data['data']['gatekeeperid'],
            subadminid: data['data']['subadminid'],
            societyid: data['data']['societyid'],
            firstName: data['data']['firstname'],
            lastName: data['data']['lastname'],
            cnic: data['data']['cnic'],
            roleId: data['data']['roleid'],
            roleName: data['data']['rolename'],
            bearerToken: data['Bearer']);

        MySharedPreferences.setUserData(user: user);
        print(user.userid);

        FirebaseMessaging.instance.getToken().then((value) {
          String? token = value;
          print('Fire Base token');
          print('--------');
          print(token);
          fcmtokenrefresh(user.userid!, token!, user.bearerToken!);
        });

        print(response.statusCode);
        print(response.statusCode);
        Get.offAndToNamed(homescreen, arguments: user);
        isLoading = false;
        update();
        myToast(msg: 'Login Successfully');
      } else if (response.statusCode == 200 && data['data']['roleid'] != 3) {
        myToast(
            msg: 'You are not Register to our System. Contact Admin',
            isNegative: true);
        isLoading = false;
        update();
      } else if (response.statusCode == 401) {
        isLoading = false;
        update();

        myToast(msg: 'Unauthorized Invalid Cnic or Password', isNegative: true);
      } else if (response.statusCode == 403) {
        isLoading = false;
        update();
        var data = jsonDecode(response.body.toString());

        if ((data['errors'] as List).contains('The cnic field is required.')) {
          isLoading = false;
          update();
          myToast(msg: 'Cnic Required', isNegative: true);
        } else if ((data['errors'] as List)
            .contains('The password field is required.')) {
          isLoading = false;
          update();
          myToast(msg: 'The password field is required', isNegative: true);
        }
      }
    } catch (SocketException) {
      isLoading = false;
      update();
      myToast(msg: 'No Internet Connection', isNegative: true);
    }
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  Future fcmtokenrefresh(int id, String fcmtoken, String bearertoken) async {
    print("Fcm token refresh Api   Hits ! ");

    try {
      final response = await Http.post(
        Uri.parse(Api.fcmtokenrefresh),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $bearertoken"
        },
        body: jsonEncode(<String, dynamic>{
          'id': id,
          'fcmtoken': fcmtoken,
        }),
      );
      print("Fcm token refresh Api Hits Successfully !");
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);

      print(data);
    } catch (SocketException) {
      myToast(msg: 'No Internet Connection', isNegative: true);
    }
  }
}
