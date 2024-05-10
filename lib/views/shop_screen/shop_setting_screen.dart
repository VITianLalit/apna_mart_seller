import "package:apna_mart_seller/const/const.dart";
import "package:apna_mart_seller/views/controller/profile_controller.dart";
import "package:apna_mart_seller/views/widgets/custom_textfield.dart";
import "package:apna_mart_seller/views/widgets/text_style.dart";
import "package:get/get.dart";

class ShopSetting extends StatelessWidget {
  const ShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(
      () => Scaffold(
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
                        await controller.updateShop(
                          shopaddress: controller.shopAddressController.text,
                          shopname: controller.shopNameController.text,
                          shopmobile: controller.shopMobileController.text,
                          shopwebsites: controller.shopWebsiteController.text,
                          shopdesc: controller.shopDesController.text,
                        );
                        VxToast.show(context, msg: "Shop updated");
                      },
                      child: normalText(text: save, color: Colors.white)),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                customTextField(
                  label: shopName,
                  hint: nameHint,
                  controller: controller.shopNameController,
                ),
                10.heightBox,
                customTextField(
                  label: address,
                  hint: shopAddressHint,
                  controller: controller.shopAddressController,
                ),
                10.heightBox,
                customTextField(
                    label: mobile,
                    hint: shopMobileHint,
                    controller: controller.shopMobileController),
                10.heightBox,
                customTextField(
                    label: website,
                    hint: shopWebsiteHint,
                    controller: controller.shopWebsiteController),
                10.heightBox,
                customTextField(
                    isDesc: true,
                    label: description,
                    hint: shopDescHint,
                    controller: controller.shopDesController)
              ],
            ),
          )),
    );
  }
}
