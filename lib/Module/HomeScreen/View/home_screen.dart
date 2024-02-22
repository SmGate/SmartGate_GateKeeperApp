// ignore_for_file: must_be_immutable

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:gatekeeper/Constants/instructions_label.dart';
import 'package:gatekeeper/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Constants/constants.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final List local = [
    {'name': 'ENGLISH', 'local': Locale('en', 'Us')},
    {'name': 'اردو', 'local': Locale('ur', 'PK')}
  ];

  FlutterTts flutterTts = FlutterTts();

  Future<void> speakUrdu(String text) async {
    await flutterTts.setLanguage('ur-PK'); // Set Urdu language
    await flutterTts.setPitch(1.0); // Set pitch (optional)
    await flutterTts.setSpeechRate(0.5); // Set speech rate (optional)
    await flutterTts.setVolume(1.0); // Set volume (optional)

    await flutterTts.speak(text);
  }

  Future<void> stopSpeaking() async {
    await flutterTts.stop();
  }

  bool isSpeaking = false;
  bool isSpeaking1 = false;
  bool isSpeaking2 = false;
  bool isSpeaking3 = false;
  bool isSpeaking4 = false;
  bool isSpeaking5 = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          // endDrawer: MyDrawer(),
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
                          padding:
                              EdgeInsets.only(left: 20, top: 50, right: 20),
                          child: Row(
                            children: [
                              Text(
                                'home'.tr,
                                style: GoogleFonts.ubuntu(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {
                                    _showBottomSheet(context);
                                  },
                                  icon: Icon(
                                    Icons.language,
                                    color: Colors.white,
                                  ))
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
                        SizedBox(
                          height: 9,
                        ),
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
                          padding: EdgeInsets.only(
                              left: 25,
                              top: 30,
                              right: Get.locale?.languageCode == 'ur' ? 30 : 0),
                          child: Row(
                            children: [
                              Text(
                                'services'.tr,
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
                            padding: EdgeInsets.only(
                                left: 20,
                                right:
                                    Get.locale?.languageCode == 'ur' ? 20 : 0),
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
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    Get.locale?.languageCode ==
                                                            'ur'
                                                        ? 20
                                                        : 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'pre_approved_entriese'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13,
                                                      color:
                                                          HexColor('#666592')),
                                                ),
                                                Text(
                                                  'you_can_pre_approve_visitor'
                                                      .tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#AAA9C9')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          isSpeaking == true
                                              ? IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking = false;
                                                      stopSpeaking();

                                                      print(isSpeaking);
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons.volume_down_alt))
                                              : IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking = true;
                                                      speakUrdu(InstructionLabels
                                                          .PRE_APPROVED_ENTRIESE_INS);
                                                      print(isSpeaking);
                                                    });
                                                  },
                                                  icon: Icon(Icons.volume_off)),
                                          // Get.locale?.languageCode == 'ur'
                                          //     ? SizedBox()
                                          //     : Padding(
                                          //         padding: EdgeInsets.only(
                                          //             left: 59.65),
                                          //         child: SvgPicture.asset(
                                          //             'assets/greaterthan.svg'),
                                          //       )
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
                            padding: EdgeInsets.only(
                                left: 20,
                                right:
                                    Get.locale?.languageCode == 'ur' ? 20 : 0),
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
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    Get.locale?.languageCode ==
                                                            'ur'
                                                        ? 20
                                                        : 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'events'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13,
                                                      color:
                                                          HexColor('#666592')),
                                                ),
                                                Text(
                                                  'you_can_view_events'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#AAA9C9')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          isSpeaking1 == true
                                              ? IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking1 = false;
                                                      stopSpeaking();

                                                      print(isSpeaking1);
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons.volume_down_alt))
                                              : IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking1 = true;
                                                      speakUrdu(
                                                          InstructionLabels
                                                              .EVENTS_INS);

                                                      print(isSpeaking1);
                                                    });
                                                  },
                                                  icon: Icon(Icons.volume_off)),
                                          // Get.locale?.languageCode == 'ur'
                                          //     ? SizedBox()
                                          //     : Padding(
                                          //         padding: EdgeInsets.only(
                                          //             left: 115.65),
                                          //         child: SvgPicture.asset(
                                          //             'assets/greaterthan.svg'),
                                          //       )
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
                            padding: EdgeInsets.only(
                                left: 20,
                                right:
                                    Get.locale?.languageCode == 'ur' ? 20 : 0),
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
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    Get.locale?.languageCode ==
                                                            'ur'
                                                        ? 20
                                                        : 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'notice_board'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13,
                                                      color:
                                                          HexColor('#666592')),
                                                ),
                                                Text(
                                                  'announcement_from_admin'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#AAA9C9')),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          isSpeaking2 == true
                                              ? IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking2 = false;
                                                      stopSpeaking();

                                                      print(isSpeaking2);
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons.volume_down_alt))
                                              : IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking2 = true;
                                                      speakUrdu(InstructionLabels
                                                          .NOTICE_BOARD_INS);

                                                      print(isSpeaking2);
                                                    });
                                                  },
                                                  icon: Icon(Icons.volume_off)),
                                          // Get.locale?.languageCode == 'ur'
                                          //     ? SizedBox()
                                          //     : Padding(
                                          //         padding: EdgeInsets.only(
                                          //             left: 75.65),
                                          //         child: SvgPicture.asset(
                                          //             'assets/greaterthan.svg'),
                                          //       )
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
                            padding: EdgeInsets.only(
                                left: 20,
                                right:
                                    Get.locale?.languageCode == 'ur' ? 20 : 0),
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
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    Get.locale?.languageCode ==
                                                            'ur'
                                                        ? 20
                                                        : 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'visitor'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13,
                                                      color:
                                                          HexColor('#666592')),
                                                ),
                                                Text(
                                                  'visitor_details'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#AAA9C9')),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Spacer(),
                                          isSpeaking3 == true
                                              ? IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking3 = false;
                                                      stopSpeaking();
                                                      print(isSpeaking3);
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons.volume_down_alt))
                                              : IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking3 = true;
                                                      speakUrdu(
                                                          InstructionLabels
                                                              .VISITOR_INS);

                                                      print(isSpeaking3);
                                                    });
                                                  },
                                                  icon: Icon(Icons.volume_off)),
                                          // Get.locale?.languageCode == 'ur'
                                          //     ? SizedBox()
                                          //     : Padding(
                                          //         padding: EdgeInsets.only(
                                          //             left: 138.65),
                                          //         child: SvgPicture.asset(
                                          //             'assets/greaterthan.svg'),
                                          //       )
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
                            padding: EdgeInsets.only(
                                left: 20,
                                right:
                                    Get.locale?.languageCode == 'ur' ? 20 : 0),
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
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    Get.locale?.languageCode ==
                                                            'ur'
                                                        ? 20
                                                        : 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'residential_emergency'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13,
                                                      color:
                                                          HexColor('#666592')),
                                                ),
                                                Text(
                                                  'residential_emergency'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#AAA9C9')),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Spacer(),
                                          isSpeaking4 == true
                                              ? IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking4 = false;
                                                      stopSpeaking();
                                                      print(isSpeaking4);
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons.volume_down_alt))
                                              : IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking4 = true;
                                                      speakUrdu(InstructionLabels
                                                          .RESIDENTIAL_EMERGENCY_INS);

                                                      print(isSpeaking4);
                                                    });
                                                  },
                                                  icon: Icon(Icons.volume_off)),
                                          // SizedBox(
                                          //   width: 60,
                                          // ),
                                          // Get.locale?.languageCode == 'ur'
                                          //     ? SizedBox()
                                          //     : SvgPicture.asset(
                                          //         'assets/greaterthan.svg')
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
                            padding: EdgeInsets.only(
                                left: 20,
                                right:
                                    Get.locale?.languageCode == 'ur' ? 20 : 0),
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
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    Get.locale?.languageCode ==
                                                            'ur'
                                                        ? 20
                                                        : 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'logout'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13,
                                                      color:
                                                          HexColor('#666592')),
                                                ),
                                                Text(
                                                  'logout_yourself'.tr,
                                                  style: GoogleFonts.ubuntu(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#AAA9C9')),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Spacer(),
                                          isSpeaking5 == true
                                              ? IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking5 = false;
                                                      stopSpeaking();

                                                      print(isSpeaking5);
                                                    });
                                                  },
                                                  icon: Icon(
                                                      Icons.volume_down_alt))
                                              : IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isSpeaking5 = true;
                                                      speakUrdu(
                                                          InstructionLabels
                                                              .LOGOUT_INS);

                                                      print(isSpeaking5);
                                                    });
                                                  },
                                                  icon: Icon(Icons.volume_off)),
                                          // Get.locale?.languageCode == 'ur'
                                          //     ? SizedBox()
                                          //     : Padding(
                                          //         padding: EdgeInsets.only(
                                          //             left: 125.65),
                                          //         child: SvgPicture.asset(
                                          //             'assets/greaterthan.svg'),
                                          //       )
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
                          height: 20,
                        )
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

  //////  METHOD FOR TEXT TO SPEECH

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SELECT LANGUAGE",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  height: 150,
                  padding: EdgeInsets.all(16.0),
                  child: ListView.builder(
                      itemCount: local.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _setLanguage(local[index]['local']);
                              },
                              child: Container(
                                  height: 30,
                                  // color: Colors.red,
                                  child: Text(local[index]['name'])),
                            ),
                            Divider()
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _setLanguage(
    Locale local,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('languageCode', local.languageCode);
    preferences.setString('countryCode', local.countryCode ?? '');

    Get.back();
    Get.updateLocale(local);
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
                  token: _homeScreenController.user.bearerToken!);
            },
          ),
        ],
      ),
    );
  }
}
