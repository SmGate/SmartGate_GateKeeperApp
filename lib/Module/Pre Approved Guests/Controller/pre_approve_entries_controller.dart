import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../Pre Approve Entry Residents/Model/PreApproveEntry.dart';

class PreApproveEntries extends GetxController {
  final cnicController = TextEditingController();
  final vechilenoController = TextEditingController();
  late final PreApproveEntry preApproveEntry;
  var data = Get.arguments[0];
  var token = Get.arguments[1];
  var status = Status.completed;
  var isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  preApproveEntriesApi(int userid, String token) async {
    final response = await Http.get(
      Uri.parse(Api.preapproveentries + "/" + userid.toString()),
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
  }

  Future updatePreApproveEntryStatusApi({
    required int id,
    required String token,
    required int status,
    required String statusdescription,
    required String cnic,
    required String vechileno,
  }) async {
    isLoading = true;

    setStatus(Status.loading);
    final response = await Http.post(
      Uri.parse(Api.updatepreapproveentrystatus),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "status": status,
        "statusdescription": statusdescription,
        "cnic": cnic,
        "vechileno": vechileno,
      }),
    );

    if (response.statusCode == 200) {
      isLoading = false;

      setStatus(Status.completed);

      Get.back();
      update();

      myToast(msg: 'CheckIn Successfully');
    } else {
      isLoading = false;

      setStatus(Status.error);

      myToast(msg: 'Failed to CheckIn', isNegative: true);
    }
  }

  Future updatePreapproveEntryCheckoutStatusApi({
    required int id,
    required String token,
    required int status,
    required String statusdescription,
  }) async {
    setStatus(Status.loading);

    final response = await Http.post(
      Uri.parse(Api.updatepreapproveentrycheckoutstatus),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token"
      },
      body: jsonEncode(<String, dynamic>{
        "id": id,
        "status": status,
        "statusdescription": statusdescription,
      }),
    );

    if (response.statusCode == 200) {
      setStatus(Status.completed);

      update();

      myToast(msg: 'Checkout Successfully');
    } else {
      setStatus(Status.error);
      myToast(msg: 'Failed to Checkout status', isNegative: true);
      throw Exception();
    }
  }

  setStatus(Status status) {
    this.status = status;
    update();
  }

  isCheckInStatus(val) {
    this.isLoading = val;
    update();
  }
}
