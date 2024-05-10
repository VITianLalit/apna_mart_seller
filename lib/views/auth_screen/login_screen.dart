// ignore_for_file: prefer_const_constructors

import 'package:apna_mart_seller/const/const.dart';
import 'package:apna_mart_seller/views/controller/auth_controller.dart';
import 'package:apna_mart_seller/views/home_screen/home.dart';
import 'package:apna_mart_seller/views/widgets/our_button.dart';
import 'package:apna_mart_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 18.0),
              20.heightBox,
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      icLogo,
                      width: 80,
                      height: 80,
                    )
                        .box
                        .border(color: white)
                        .rounded
                        .padding(EdgeInsets.all(8))
                        .make(),
                    15.heightBox,
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: boldText(
                          text: appname, color: Colors.white, size: 20.0),
                    )
                  ],
                ),
              ),
              50.heightBox,
              normalText(text: loginto, size: 18.0, color: lightGrey),
              10.heightBox,
              Obx(
                () => Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        fillColor: textfieldGrey,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: purpleColor,
                        ),
                        border: InputBorder.none,
                        hintText: emailHint,
                      ),
                    ),
                    10.heightBox,
                    TextFormField(
                      obscureText: true,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        fillColor: textfieldGrey,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: purpleColor,
                        ),
                        border: InputBorder.none,
                        hintText: passwordHint,
                      ),
                    ),
                    10.heightBox,
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: normalText(
                                text: forgotPassword, color: purpleColor))),
                    30.heightBox,
                    SizedBox(
                      width: context.screenWidth - 200,
                      child: controller.isLoading.value
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(purpleColor),
                            )
                          : ourButton(
                              title: login,
                              onPress: () async {
                                // Get.to(() => Home());
                                controller.isLoading(true);
                                await controller
                                    .loginMethod(context: context)
                                    .then((value) {
                                  if (value != null) {
                                    VxToast.show(context, msg: "Logged in");
                                    controller.isLoading(false);
                                    Get.offAll(() => const Home());
                                  } else {
                                    controller.isLoading(false);
                                  }
                                });
                              },
                            ),
                    )
                  ],
                )
                    .box
                    .white
                    .rounded
                    .outerShadowMd
                    .padding(EdgeInsets.all(8))
                    .make(),
              ),
              10.heightBox,
              Center(child: normalText(text: anyProblem, color: lightGrey)),
              Spacer(),
              Center(child: boldText(text: credit, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
