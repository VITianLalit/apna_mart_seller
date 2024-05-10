import 'package:apna_mart_seller/const/colors.dart';
import 'package:apna_mart_seller/const/const.dart';
import 'package:apna_mart_seller/views/order_screen/order_details.dart';
import 'package:apna_mart_seller/views/widgets/appbar_widget.dart';
import 'package:apna_mart_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(orders),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) => ListTile(
                      onTap: () {
                        Get.to(() => OrderDetails());
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      tileColor: textfieldGrey,
                      title: boldText(
                          text: "89632587412587896", color: purpleColor),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: fontGrey,
                              ),
                              10.widthBox,
                              boldText(
                                  text: intl.DateFormat()
                                      .add_yMd()
                                      .format(DateTime.now()),
                                  color: fontGrey),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.payment,
                                color: fontGrey,
                              ),
                              10.widthBox,
                              boldText(text: unpaid, color: red),
                            ],
                          )
                          // normalText(text: "\$40.0", color: darkGrey),
                        ],
                      ),
                      trailing: boldText(
                          text: "\$40", color: purpleColor, size: 16.0),
                    ).box.margin(EdgeInsets.only(bottom: 4)).make()),
          ),
        ),
      ),
    );
  }
}
