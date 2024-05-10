import 'package:apna_mart_seller/const/const.dart';
import 'package:apna_mart_seller/views/products_screen/components/product_dropdown.dart';
import 'package:apna_mart_seller/views/products_screen/components/product_images.dart';
import 'package:apna_mart_seller/views/widgets/custom_textfield.dart';
import 'package:apna_mart_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            )),
        title: boldText(text: "Add Product", color: white, size: 16.0),
        actions: [
          TextButton(
              onPressed: () {}, child: boldText(text: save, color: white)),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(hint: "eg. BMW", label: "Product name"),
              10.heightBox,
              customTextField(
                  hint: "eg. Noce Product", label: "Description", isDesc: true),
              10.heightBox,
              customTextField(hint: "eg. \$100", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. \$100", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. 20", label: "Quantity"),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              boldText(text: "Choose product images", color: white),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    3, (index) => productImages(label: "${index + 1}")),
              ),
              5.heightBox,
              normalText(
                  text: "First image will be your display image",
                  color: lightGrey),
              10.heightBox,
              boldText(text: "Choose product colors", color: white),
              10.heightBox,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                    9,
                    (index) => Stack(
                          alignment: Alignment.center,
                          children: [
                            VxBox()
                                .color(Vx.randomPrimaryColor)
                                .roundedFull
                                .size(40, 40)
                                .make(),
                            const Icon(
                              Icons.done,
                              color: white,
                            ),
                          ],
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
