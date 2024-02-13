import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gatekeeper/Widgets/Empty%20List/empty_list.dart';
import 'package:gatekeeper/Widgets/Loader/loader.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/Dialog Box Elipse Heading/dialog_box_elipse_heading.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../Controller/residential_emergency_controller.dart';

class ResidentialEmergencyScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResidentialEmergencyController>(
        init: ResidentialEmergencyController(),
        builder: (controller) {
          return WillPopScope(
            onWillPop: () async {
              Get.offNamed(homescreen, arguments: controller.userdata);
              return false;
            },
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Column(
                    children: [
                      MyBackButton(
                        text: 'Emergency',
                        onTap: () {
                          Get.offNamed(homescreen,
                              arguments: controller.userdata);
                        },
                      ),
                      22.h.ph,
                      Expanded(
                        child: FutureBuilder(
                            future: controller.viewVistorsDetailApi(
                                controller.userdata.subadminid!,
                                controller.userdata.bearerToken!),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.data != null &&
                                    snapshot.data.data!.length != 0) {
                                  return ListView.builder(
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                          content: EmergencyDialog(
                                                              problem: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .problem,
                                                              createdAt: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .createdAt,
                                                              address: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .resident
                                                                  .first
                                                                  .address,
                                                              mobileNo: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .resident
                                                                  .first
                                                                  .mobileno,
                                                              description: snapshot
                                                                  .data!
                                                                  .data![index]
                                                                  .description),
                                                        ));
                                          },
                                          child: EmergencyCard(snapshot, index),
                                        );
                                      },
                                      itemCount: snapshot.data.data.length);
                                } else {
                                  return EmptyList(
                                    name: "No Emergency Reported.",
                                  );
                                }
                              } else if (snapshot.hasError) {
                                return Loader();
                              } else {
                                return Loader();
                              }
                            }),
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  Widget EmergencyCard(AsyncSnapshot<dynamic> snapshot, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 14.w, top: 15.h),
      child: SizedBox(
        width: 337.w,
        height: 80.w,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 19.w),
                child: Image.asset('assets/emergency.png'),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      9.h.ph,
                      Text(
                        '${snapshot.data.data[index].problem}',
                        style: GoogleFonts.poppins(
                            color: HexColor('#282829'),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      Text('${snapshot.data.data[index].description}',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: HexColor('#B8B8B8'),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    11.h.ph,
                    Text(
                        '${convertUtcToDayOfWeekWithOffset(snapshot.data.data[index].createdAt)}',
                        style: GoogleFonts.montserrat(
                            color: HexColor('#666666'),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500)),
                    5.h.ph,
                    Text(
                        '${convertUtcToFormattedTimeAdd5Hours(snapshot.data.data[index].createdAt)}',
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                            color: HexColor('#666666'),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmergencyDialog extends StatelessWidget {
  final String? problem;
  final String? description;
  final String? address;
  final String? createdAt;
  final String? mobileNo;

  const EmergencyDialog({
    super.key,
    required this.problem,
    required this.description,
    required this.address,
    required this.createdAt,
    required this.mobileNo,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(problem ?? "",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: HexColor('#606470'))),
          ),
          14.h.ph,
          DialogBoxElipseHeading(
            text: "Emergency At",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Text(
                convertDateFormatToDayMonthYearDateFormat(createdAt!) ?? "",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: HexColor('#606470'))),
          ),
          8.95.h.ph,
          DialogBoxElipseHeading(
            text: "Address",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Text(address ?? "",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: HexColor('#606470'))),
          ),
          8.95.h.ph,
          DialogBoxElipseHeading(
            text: "Mobile No",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Row(
              children: [
                Text(mobileNo ?? "",
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: HexColor('#606470'))),
                SizedBox(
                  width: 4,
                ),
                IconButton(
                    onPressed: () async {
                      final ResidentialEmergencyController controller =
                          Get.find();
                      controller.uri = Uri.parse("tel://${mobileNo}");

                      try {
                        await launchUrl(controller.uri!);
                        controller.uri = null;
                      } catch (e) {
                        myToast(msg: e.toString(), isNegative: true);
                      }
                    },
                    icon: Icon(
                      Icons.call,
                      color: Colors.green,
                    ))
              ],
            ),
          ),
          8.95.h.ph,
          DialogBoxElipseHeading(
            text: "Description",
          ),
          8.95.h.ph,
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: Text(description ?? "",
                style: GoogleFonts.ubuntu(
                    fontSize: 11.sp, color: HexColor('#333333'))),
          ),
          14.h.ph,
          Center(
            child: MyButton(
              border: 4.r,
              width: 67.w,
              height: 22.w,
              name: 'Ok',
              onPressed: () {
                Get.back();
              },
            ),
          ),
          14.h.ph,
        ],
      ),
    );
  }
}
