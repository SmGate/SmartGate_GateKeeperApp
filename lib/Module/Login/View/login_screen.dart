import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Constants/constants.dart';
import '../../../Widgets/My Button/my_button.dart';
import '../../../Widgets/My Password TextForm Field/my_password_textform_field.dart';
import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/login_controller.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        38.h.ph,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 58.w),
                          child: Image.asset(
                            'assets/login_vector.png',
                            width: 302.w,
                            height: 201.w,
                          ),
                        ),
                        33.91.h.ph,
                        Padding(
                          padding: EdgeInsets.fromLTRB(44.w, 0, 0, 0),
                          child: Text(
                            "Welcome To",
                            style: GoogleFonts.ubuntu(
                              color: HexColor('#4D4D4D'),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 36.sp,
                            ),
                          ),
                        ),
                        19.h.ph,
                        Padding(
                          padding: EdgeInsets.fromLTRB(46.w, 0, 0, 0),
                          child: Text(
                            "YOUR ACCOUNT",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ubuntu(
                                color: HexColor('#717171'),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                letterSpacing: 3.w),
                          ),
                        ),
                        34.h.ph,
                        Padding(
                          padding: EdgeInsets.fromLTRB(158.w, 0, 0, 0),
                          child: Text(
                            "Log In",
                            style: GoogleFonts.ubuntu(
                              color: HexColor('#FF9900'),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        38.h.ph,
                        MyTextFormField(
                          controller: controller.userCnicController,
                          textInputType: TextInputType.number,
                          validator: emptyStringValidator,
                          hintText: 'CNIC',
                          labelText: 'CNIC',
                        ),
                        MyPasswordTextFormField(
                            controller: controller.userPasswordController,
                            validator: emptyStringValidator,
                            labelText: 'Password',
                            hintText: 'Password',
                            togglePasswordView: controller.togglePasswordView,
                            obscureText: controller.isHidden),
                        45.h.ph,
                        Center(
                          child: MyButton(
                            loading: controller.isLoading,
                            name: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (!controller.isLoading) {
                                  controller.loginApi(
                                      controller.userCnicController.text,
                                      controller.userPasswordController.text);
                                }
                              }
                            },
                          ),
                        ),
                        10.h.ph
                      ]),
                ),
              );
            }),
      ),
    );
  }
}
