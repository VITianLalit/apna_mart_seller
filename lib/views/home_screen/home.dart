import 'package:apna_mart_seller/const/const.dart';
import 'package:apna_mart_seller/views/controller/home_controller.dart';
import 'package:apna_mart_seller/views/home_screen/home_screen.dart';
import 'package:apna_mart_seller/views/order_screen/order_screen.dart';
import 'package:apna_mart_seller/views/products_screen/product_screen.dart';
import 'package:apna_mart_seller/views/profile_screen/profile_screen.dart';
import 'package:apna_mart_seller/views/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navScreen = [
      const HomeScreen(),
      const ProductsScreen(),
      const OrdersScreen(),
      const ProfileScreen()
    ];

    var bottomNavbar = [
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: darkGrey,
          ),
          label: dashboard),
      BottomNavigationBarItem(
        icon: Image.asset(
          icProducts,
          color: darkGrey,
          width: 24,
        ),
        label: products,
      ),
      BottomNavigationBarItem(
          icon: Image.asset(
            icOrders,
            width: 24,
            color: darkGrey,
          ),
          label: orders),
      BottomNavigationBarItem(
          icon: Image.asset(
            icGeneralSettings,
            color: darkGrey,
            width: 24,
          ),
          label: setting),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            controller.navIndex.value = index;
          },
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          items: bottomNavbar,
        ),
      ),
      body: Column(
        children: [
          Obx(() =>
              Expanded(child: navScreen.elementAt(controller.navIndex.value))),
        ],
      ),
    );
  }
}
