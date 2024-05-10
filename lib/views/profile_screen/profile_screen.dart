import 'package:apna_mart_seller/const/colors.dart';
import 'package:apna_mart_seller/const/const.dart';
import 'package:apna_mart_seller/services/store_services.dart';
import 'package:apna_mart_seller/views/auth_screen/login_screen.dart';
import 'package:apna_mart_seller/views/controller/auth_controller.dart';
import 'package:apna_mart_seller/views/controller/profile_controller.dart';
import 'package:apna_mart_seller/views/message_screen/messages_screen.dart';
import 'package:apna_mart_seller/views/profile_screen/edit_profileScreen.dart';
import 'package:apna_mart_seller/views/shop_screen/shop_setting_screen.dart';
import 'package:apna_mart_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: setting, size: 16.0, color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfileScreen(
                      username: controller.snapshotData['vendor_name'],
                    ));
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
          TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutMethod(context);
                Get.offAll(() => const LoginScreen());
              },
              child: normalText(text: logout)),
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfile(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(purpleColor));
          } else {
            controller.snapshotData = snapshot.data!.docs[0];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: controller.snapshotData['imageUrl'] == ''
                        ? Image.asset(
                            imgProduct,
                            width: 130,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.network(
                            controller.snapshotData['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                    // leading: Image.asset(imgProduct)
                    //     .box
                    //     .roundedFull
                    //     .clip(Clip.antiAlias)
                    //     .make(),
                    title: boldText(
                        text: "${controller.snapshotData['vendor_name']}",
                        color: Colors.white),
                    subtitle:
                        normalText(text: "${controller.snapshotData['email']}"),
                  ),
                  const Divider(),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                          profileButtonTitles.length,
                          (index) => ListTile(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      Get.to(() => const ShopSetting());
                                      break;
                                    case 1:
                                      Get.to(() => const MessagesScreen());
                                      break;
                                    default:
                                  }
                                },
                                leading: Icon(
                                  profileButtonsIcons[index],
                                  color: Colors.white,
                                ),
                                title: normalText(
                                    text: profileButtonTitles[index]),
                              )),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
