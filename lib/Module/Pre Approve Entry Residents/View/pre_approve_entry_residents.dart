import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gatekeeper/Constants/api_routes.dart';
import 'package:gatekeeper/Routes/set_routes.dart';
import 'package:gatekeeper/Widgets/Empty%20List/empty_list.dart';
import 'package:gatekeeper/Widgets/Loader/loader.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Back Button/my_back_button.dart';
import '../Controller/pre_approve_entry_residents_controller.dart';

class PreApproveEntryResidents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PreApproveEntryResdientsController>(
        init: PreApproveEntryResdientsController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
                body: Column(
              children: [
                MyBackButton(
                  text: 'Residents',
                ),
                22.h.ph,
                Expanded(
                  child: FutureBuilder(
                      future: controller.preApproveEntryResidentApi(
                          controller.userdata.userid!,
                          controller.userdata.bearerToken!),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.data != null &&
                              snapshot.data!.data.length != 0) {
                            return ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 10.h),
                                    child: SizedBox(
                                      width: 300.w,
                                      height: 80.w,
                                      child: Card(
                                        elevation: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            titleTextStyle: GoogleFonts.ubuntu(
                                                color: HexColor('#606470'),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp),
                                            subtitleTextStyle:
                                                GoogleFonts.ubuntu(
                                                    color: HexColor('#333333'),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11.sp),
                                            onTap: () {
                                              Get.toNamed(preApprovedGuests,
                                                  arguments: [
                                                    snapshot.data.data[index],
                                                    controller
                                                        .userdata.bearerToken!
                                                  ]);
                                            },
                                            leading: CachedNetworkImage(
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                width: 100.w,
                                                height: 100.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.contain),
                                                ),
                                              ),
                                              width: 100.w,
                                              height: 100.w,
                                              imageUrl: Api.imageBaseUrl +
                                                  snapshot
                                                      .data.data![index].image
                                                      .toString(),
                                              placeholder: (context, url) =>
                                                  Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: primaryColor,
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                            title: Text(
                                                "${snapshot.data.data![index].firstname.toString()} ${snapshot.data.data![index].lastname.toString()}"),
                                            subtitle: Text(
                                                "${snapshot.data.data![index].address.toString()}"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: snapshot.data.data.length);
                          } else {
                            return EmptyList(
                              name: 'No Residents',
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
          );
        });
  }
}
