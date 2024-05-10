import 'dart:io';

import 'package:apna_mart_seller/const/const.dart';
import 'package:apna_mart_seller/views/controller/profile_controller.dart';
import 'package:apna_mart_seller/views/widgets/custom_textfield.dart';
import 'package:apna_mart_seller/views/widgets/text_style.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;

  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.nameController.text = widget.username!;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldText(text: setting, size: 16.0, color: Colors.white),
          actions: [
            controller.isLoading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(white),
                  )
                : TextButton(
                    onPressed: () async {
                      controller.isLoading(true);
                      //  if Image is not selelcted
                      if (controller.profileImgPath.value.isNotEmpty) {
                        await controller.uploadProfileImage();
                      } else {
                        controller.profileImageLink =
                            controller.snapshotData['imageUrl'];
                      }
                      // if old password matches database
                      if (controller.snapshotData['password'] ==
                          controller.oldPassController.text) {
                        await controller.changeAuthPassword(
                            email: controller.snapshotData['email'],
                            password: controller.oldPassController.text,
                            newPassword: controller.newPassController.text);
                        await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController.text,
                          password: controller.newPassController.text,
                        );
                        VxToast.show(context, msg: "Updated");
                      } else if (controller
                              .oldPassController.text.isEmptyOrNull &&
                          controller.newPassController.text.isEmptyOrNull) {
                        await controller.updateProfile(
                          imgUrl: controller.profileImageLink,
                          name: controller.nameController.text,
                          password: controller.snapshotData['password'],
                        );
                        VxToast.show(context, msg: "Updated");
                      } else {
                        VxToast.show(context, msg: "Some Error Occured");
                        controller.isLoading(false);
                      }
                    },
                    child: normalText(text: save, color: Colors.white)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              controller.snapshotData['imageUrl'] == '' &&
                      controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProduct,
                      width: 130,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : controller.snapshotData['imageUrl'] != '' &&
                          controller.profileImgPath.isEmpty
                      ? Image.network(
                          controller.snapshotData['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),

              // Image.asset(
              //   imgProduct,
              //   width: 150,
              // ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                  ),
                  onPressed: () {
                    controller.changeImage(context);
                  },
                  child: normalText(text: changeImage, color: fontGrey)),
              10.heightBox,
              const Divider(
                color: white,
              ),
              20.heightBox,
              customTextField(
                  label: name,
                  hint: "@LalitDev",
                  controller: controller.nameController),
              30.heightBox,
              Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(text: "Change your password", color: white)),
              10.heightBox,
              customTextField(
                  label: password,
                  hint: passwordHint,
                  controller: controller.oldPassController),
              10.heightBox,
              customTextField(
                  label: confirmPassword,
                  hint: passwordHint,
                  controller: controller.newPassController),
            ],
          ),
        ),
      ),
    );
  }
}
