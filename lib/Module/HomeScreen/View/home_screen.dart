import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gatekeeper/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class HomeScreen extends StatelessWidget {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          endDrawer: MyDrawer(),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: Get.height * 0.563,
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/home.jpeg'),
                          fit: BoxFit.cover)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 38, top: 78),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState!.openEndDrawer();
                                },
                                child: Container(
                                  width: 20,
                                  child: SvgPicture.asset('assets/drawer.svg'),
                                ),
                              ),
                              20.w.pw,
                              Text(
                                'Home',
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 26,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Text(
                            "Welcome , ${controller.user.firstName} ${controller.user.lastName}",
                            style: GoogleFonts.ubuntu(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 25),
                        //   child: Text(
                        //     'Please enter services you want',
                        //     style: GoogleFonts.ubuntu(
                        //         fontStyle: FontStyle.normal,
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 12,
                        //         color: HexColor('#FFD2D2')),
                        //   ),
                        // ),
                        SizedBox(
                          height: 9,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 25),
                        //   child: SizedBox(
                        //     height: 48,
                        //     width: 325,
                        //     child: TextField(
                        //       decoration: InputDecoration(
                        //           suffixIcon: IconButton(
                        //             onPressed: () {},
                        //             icon: Container(
                        //               child: SvgPicture.asset(
                        //                 'assets/arrow.svg',
                        //               ),
                        //             ),
                        //           ),
                        //           enabledBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(15.0),
                        //             borderSide:
                        //                 BorderSide(color: Color(0xffF4F4F4)),
                        //           ),
                        //           filled: true,
                        //           fillColor: Color(0xffFFFFFF),
                        //           labelText: 'Search',
                        //           border: OutlineInputBorder(
                        //             borderSide: BorderSide(
                        //               style: BorderStyle.solid,
                        //             ),
                        //             borderRadius: BorderRadius.circular(15.0),
                        //           )),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 13,
                        ),
                        Center(
                          child: Container(
                            child: SvgPicture.asset('assets/building.svg'),
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 440),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: HexColor('#FFFFFF'),
                    ),
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 25, top: 30),
                          child: Row(
                            children: [
                              Text(
                                'Our Services',
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: HexColor('#666592')),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(left: 154),
                              //   child: Text(
                              //     'View All',
                              //     style: GoogleFonts.ubuntu(
                              //         fontStyle: FontStyle.normal,
                              //         fontWeight: FontWeight.w500,
                              //         fontSize: 13,
                              //         color: HexColor('#8584A5')),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 8,
                              // ),
                              // SvgPicture.asset('assets/arrow.svg'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 19,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(preApproveEntryResidents,
                                arguments: controller.user);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 64,
                              width: 324,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: HexColor('#FAFAFA')),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              maxRadius: 20,
                                              backgroundColor: Color.fromRGBO(
                                                  255, 153, 0, 0.35),
                                              child: Image.asset(
                                                  'assets/team.png')),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Pre Approve Entries',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13,
                                                    color: HexColor('#666592')),
                                              ),
                                              Text(
                                                'You Can Pre Approve Your Visitor',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: HexColor('#AAA9C9')),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 59.65),
                                            child: SvgPicture.asset(
                                                'assets/greaterthan.svg'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(eventsscreen,
                                arguments: controller.user);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 64,
                              width: 324,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: HexColor('#FAFAFA')),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              maxRadius: 20,
                                              backgroundColor: Color.fromRGBO(
                                                  255, 153, 0, 0.35),
                                              child: Image.asset(
                                                  'assets/event.png')),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Events',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13,
                                                    color: HexColor('#666592')),
                                              ),
                                              Text(
                                                'You Can View Events',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: HexColor('#AAA9C9')),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 115.65),
                                            child: SvgPicture.asset(
                                                'assets/greaterthan.svg'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(noticeboardscreen,
                                arguments: controller.user);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 64,
                              width: 324,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: HexColor('#FAFAFA')),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              maxRadius: 20,
                                              backgroundColor: Color.fromRGBO(
                                                  255, 153, 0, 0.35),
                                              child: Image.asset(
                                                  'assets/noticeboard.png')),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Notice Board',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13,
                                                    color: HexColor('#666592')),
                                              ),
                                              Text(
                                                'Announcements From Admin',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: HexColor('#AAA9C9')),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 75.65),
                                            child: SvgPicture.asset(
                                                'assets/greaterthan.svg'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(vistorDetailScreen,
                                arguments: controller.user);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 64,
                              width: 324,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: HexColor('#FAFAFA')),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              maxRadius: 20,
                                              backgroundColor: Color.fromRGBO(
                                                  255, 153, 0, 0.35),
                                              child: Image.asset(
                                                'assets/visitor.png',
                                                width: 24,
                                              )),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Visitor',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13,
                                                    color: HexColor('#666592')),
                                              ),
                                              Text(
                                                'Visitors Detail',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: HexColor('#AAA9C9')),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 138.65),
                                            child: SvgPicture.asset(
                                                'assets/greaterthan.svg'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(residentialEmergencyScreen,
                                arguments: controller.user);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 64,
                              width: 324,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: HexColor('#FAFAFA')),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              maxRadius: 20,
                                              backgroundColor: Color.fromRGBO(
                                                  255, 153, 0, 0.35),
                                              child: Image.asset(
                                                'assets/emergency.png',
                                                width: 24,
                                              )),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Residential Emergency',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13,
                                                    color: HexColor('#666592')),
                                              ),
                                              Text(
                                                'Residential Emergency',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: HexColor('#AAA9C9')),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 60,
                                          ),
                                          SvgPicture.asset(
                                              'assets/greaterthan.svg')
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            MySharedPreferences.deleteUserData();
                            Get.offAllNamed(loginscreen);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: SizedBox(
                              height: 64,
                              width: 324,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: HexColor('#FAFAFA')),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 30, top: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              maxRadius: 20,
                                              backgroundColor: Color.fromRGBO(
                                                  255, 153, 0, 0.35),
                                              child: Image.asset(
                                                'assets/logout.png',
                                                width: 24,
                                              )),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Logout',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13,
                                                    color: HexColor('#666592')),
                                              ),
                                              Text(
                                                'Logout Yourself',
                                                style: GoogleFonts.ubuntu(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10,
                                                    color: HexColor('#AAA9C9')),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 125.65),
                                            child: SvgPicture.asset(
                                                'assets/greaterthan.svg'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                HexColor('#FB7712'),
                HexColor('#FF9900'),
              ])),
              child: Stack(
                children: [
                  Text(
                    "Gatekeeper App",
                    style: GoogleFonts.ubuntu(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                        fontSize: 15),
                  ),
                ],
              )),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: primaryColor,
            ),
            title: Text("Logout"),
            onTap: () async {
              await FirebaseMessaging.instance.deleteToken();
              final HomeScreenController _homeScreenController = Get.find();
              _homeScreenController.logoutApi(
                  token: _homeScreenController.user!.bearerToken!);
            },
          ),
        ],
      ),
    );
  }
}
