import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gatekeeper/Constants/constants.dart';
import 'package:gatekeeper/Module/Pre%20Approved%20Guests/Controller/pre_approve_entries_controller.dart';
import 'package:gatekeeper/Widgets/Loader/loader.dart';
import 'package:gatekeeper/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Widgets/Dialog Box Elipse Heading/dialog_box_elipse_heading.dart';
import '../../../Widgets/Empty List/empty_list.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';

class PreApprovedGuests extends GetView {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<PreApproveEntries>(
            init: PreApproveEntries(),
            builder: (controller) {
              return Scaffold(
                body: Column(
                  children: [
                    MyBackButton(
                      text: 'Pre Approve Entry',
                    ),
                    if (controller.status == Status.completed) ...[
                      Expanded(
                        child: FutureBuilder(
                            future: controller.preApproveEntriesApi(
                                controller.data.userid, controller.token),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.data != null &&
                                    snapshot.data!.data.length != 0) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                      content:
                                                          PreApproveEntryDialog(
                                                    name: snapshot
                                                        .data.data[index].name,
                                                    description: snapshot
                                                        .data
                                                        .data[index]
                                                        .description,
                                                    arrivaldate: snapshot
                                                        .data
                                                        .data[index]
                                                        .arrivaldate,
                                                    arrivaltime: snapshot
                                                        .data
                                                        .data[index]
                                                        .arrivaltime,
                                                    cnic: snapshot
                                                        .data.data[index].cnic,
                                                    mobileno: snapshot.data
                                                        .data[index].mobileno,
                                                    vechileno: snapshot.data
                                                        .data[index].vechileno,
                                                    visitortype: snapshot
                                                        .data
                                                        .data[index]
                                                        .visitortype,
                                                  )));
                                        },
                                        child: PreApproveEntryCard(snapshot,
                                            index, controller, context),
                                      );
                                    },
                                  );
                                } else {
                                  return EmptyList(
                                    name: 'No Preapprove Entry',
                                  );
                                }
                              } else if (snapshot.hasError) {
                                return Loader();
                              } else {
                                return Loader();
                              }
                            }),
                      )
                    ] else if (controller.status == Status.loading) ...[
                      Loader()
                    ] else ...[
                      EmptyList(
                        name: 'Something Went Wrong',
                      )
                    ]
                  ],
                ),
              );
            }));
  }

  Widget PreApproveEntryCard(AsyncSnapshot<dynamic> snapshot, int index,
      PreApproveEntries controller, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: SizedBox(
        width: 343,
        height: 79,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset('assets/cardbg.svg', fit: BoxFit.fill),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 11, 0, 0),
                child: Text(
                  snapshot.data.data[index].name,
                  style: GoogleFonts.montserrat(
                      color: HexColor('#4D4D4D'),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 32, 75, 0),
                child: Row(
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      'Visitor Type: ',
                      style: GoogleFonts.ubuntu(
                          color: HexColor('#757575'),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      snapshot.data.data[index].visitortype.toString(),
                      style: GoogleFonts.ubuntu(
                          color: HexColor('#757575'),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: snapshot.data.data[index].status == 2
                    ? Row(
                        children: [
                          SizedBox(
                            width: 11.2,
                          ),
                          Text(
                            'Checkin Time: ',
                            style: GoogleFonts.ubuntu(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            Hour12formatTime(
                                snapshot.data.data[index].checkintime),
                            style: GoogleFonts.ubuntu(
                                color: HexColor('#A5AAB7'),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          SizedBox(
                            width: 11.2,
                          ),
                          Text(
                            'Expected Arrival Time: ',
                            style: GoogleFonts.ubuntu(
                                color: HexColor('#A5AAB7'),
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            Hour12formatTime(
                                snapshot.data.data[index].arrivaltime),
                            style: GoogleFonts.ubuntu(
                                color: HexColor('#A5AAB7'),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
              ),
              if (snapshot.data.data[index].status == 1) ...[
                GestureDetector(
                  onTap: () {
                    controller.cnicController.text =
                        snapshot.data.data[index].cnic.toString();
                    controller.vechilenoController.text =
                        snapshot.data.data[index].vechileno.toString();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Text(
                                    'Pre Approve Entry',
                                    style: GoogleFonts.ubuntu(
                                        color: HexColor('#4D4D4D'),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  )),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Center(
                                    child: MyTextFormField(
                                      controller: controller.cnicController,
                                      width: 173,
                                      height: 30,
                                      labelText: "CNIC",
                                      hintText: 'CNIC',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Center(
                                    child: MyTextFormField(
                                      controller:
                                          controller.vechilenoController,
                                      width: 173,
                                      height: 30,
                                      labelText: "VEHICLE NO",
                                      hintText: 'VEHICLE NO',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 37,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (!controller.isLoading) {
                                              controller
                                                  .updatePreApproveEntryStatusApi(
                                                      id: snapshot
                                                          .data.data[index].id!,
                                                      token: controller.token,
                                                      status: 2,
                                                      statusdescription:
                                                          'CheckIn',
                                                      cnic: controller
                                                          .cnicController.text,
                                                      vechileno: controller
                                                          .vechilenoController
                                                          .text);
                                            }
                                          },
                                          child: MyStatusWidget(
                                            width: 81,
                                            height: 22,
                                            status: 'Check In',
                                            color: HexColor('#26B82C'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 13,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: MyStatusWidget(
                                            width: 81,
                                            height: 22,
                                            status: 'Cancel',
                                            color: HexColor('#BABABA'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 42, 14, 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: MyStatusWidget(
                        width: 81,
                        height: 22,
                        status: 'Check In',
                        color: HexColor('#26B82C'),
                      ),
                    ),
                  ),
                )
              ] else if (snapshot.data.data[index].status == 2) ...[
                GestureDetector(
                  onTap: () {
                    controller.updatePreapproveEntryCheckoutStatusApi(
                        id: snapshot.data.data[index].id!,
                        token: controller.token,
                        status: 3,
                        statusdescription: 'Checkout');
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 42, 14, 0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: MyStatusWidget(
                        width: 81,
                        height: 22,
                        status: 'Check out',
                        color: HexColor('#ED0909'),
                      ),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget MyStatusWidget(
      {required status,
      required color,
      Color? textColor,
      double? width,
      double? height}) {
    return Container(
      width: width ?? 64,
      height: height ?? 18,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            fontSize: 10,
            color: textColor ?? HexColor('#FFFFFF'),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class PreApproveEntryDialog extends StatelessWidget {
  final String? name;
  final String? description;
  final String? visitortype;
  final String? vechileno;
  final String? mobileno;
  final String? arrivaldate;
  final String? arrivaltime;
  final String? cnic;

  const PreApproveEntryDialog(
      {super.key,
      required this.name,
      required this.description,
      required this.visitortype,
      required this.vechileno,
      required this.mobileno,
      required this.arrivaldate,
      required this.arrivaltime,
      required this.cnic});

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(name ?? "",
                style: GoogleFonts.montserrat(
                  color: HexColor("#4D4D4D"),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                )),
          ),
          Center(
            child: Text(description ?? "",
                style: GoogleFonts.ubuntu(
                  color: HexColor("#4D4D4D"),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
          ),
          23.33.ph,
          DialogBoxElipseHeading(text: 'Visitor Type'),
          DialogBoxText(
            text: visitortype ?? "",
          ),
          23.33.ph,
          DialogBoxElipseHeading(text: 'Vechile No'),
          DialogBoxText(
            text: vechileno ?? "",
          ),
          23.33.ph,
          DialogBoxElipseHeading(text: 'Mobile No'),
          DialogBoxText(
            text: mobileno ?? "",
          ),
          23.33.ph,
          DialogBoxElipseHeading(text: 'Expected Arrival Time'),
          DialogBoxText(
            text: Hour12formatTime(arrivaltime!) ?? "",
          ),
          23.33.ph,
          DialogBoxElipseHeading(text: 'CNIC'),
          DialogBoxText(
            text: cnic ?? "",
          ),
          23.33.ph,
          DialogBoxElipseHeading(text: 'Expected Arrival Date'),
          DialogBoxText(text: arrivaldate ?? ""),
        ],
      ),
    );
  }
}

class DialogBoxText extends StatelessWidget {
  final String? text;

  const DialogBoxText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Text(
        text ?? "",
        style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: HexColor('#1A1A1A')),
      ),
    );
  }
}
