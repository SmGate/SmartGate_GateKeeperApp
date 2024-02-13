import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import '../Model/PreApproveEntry.dart';

class PreApproveEntryResdientsController extends GetxController {
  var user = Get.arguments;

  late final User userdata;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
    userdata = this.user;
  }

  preApproveEntryResidentApi(int userid, String token) async {
    print("token $token");

    final response = await Http.get(
      Uri.parse(Api.preapproveentryresidents + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return PreApproveEntry.fromJson(data);
    }
    return PreApproveEntry.fromJson(data);
    ;
  }
}
