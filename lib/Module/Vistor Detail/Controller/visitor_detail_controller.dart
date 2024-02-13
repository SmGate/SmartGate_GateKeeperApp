import 'dart:convert';

import 'package:gatekeeper/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../Login/Model/User.dart';
import '../Model/VistorDetail.dart';

class VisitorDetailController extends GetxController {
  late final User userdata;

  var data = Get.arguments;
  DateTime currentDateTime = DateTime.now();
  String? currentDate;
  String? currentTime;
  var status = Status.completed;
  var isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    userdata = data;
  }

  viewVisitorsDetailApi(int userid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.viewvistordetail + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(response.body);
      return VistorDetail.fromJson(data);
    }
    return VistorDetail.fromJson(data);
  }

  Future UpdateVisitorDetailApi({
    required String token,
    required int vid,
    required String checkoutdate,
    required String checkouttime,
  }) async {
    setStatus(Status.loading);
    isLoading = true;
    update();

    final response = await Http.post(
      Uri.parse(Api.updateVistorStatus),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "id": vid,
        "checkoutdate": checkoutdate,
        "checkouttime": checkouttime,
        "status": 1,
        "statusdescription": "check-out",
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      setStatus(Status.completed);

      myToast(msg: 'Visitor Check-Out Successfully');
      Get.back();

      // viewVisitorsDetailApi(userdata.societyid!, userdata.bearerToken!);
      isLoading = false;
      update();
    } else {
      setStatus(Status.error);
      isLoading = false;
      update();

      myToast(msg: 'Failed to Add Visitor Detail');
      throw Exception('Failed to Add Visitor Detail');
    }
  }

  setStatus(Status status) {
    this.status = status;
    update();
  }
}
