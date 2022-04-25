import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/Controllers/page_controller.dart';
import 'package:refferalapp/Views/reusables/general_button.dart';

import '../../Controllers/user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userController = Get.find<UserController>();
    final pageController = Get.find<MyPageController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.075, horizontal: size.width * 0.1),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
             Text(
              "Referral Section",
              style: TextStyle(
                  fontSize: size.height * 0.03, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width,
              child: Obx(() {
                var name = userController.currentUser.value == null
                    ? "Investor"
                    : userController.currentUser.value!.name;
                return Text("Hey $name !",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: size.height * 0.035,
                        fontWeight: FontWeight.w700));
              }),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text("Why don't you introduce us to your friends?",
                style: TextStyle(
                    fontSize: size.height * 0.0225,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
                "Invite a friend to invest on BHIVE.fund and get a cashback equal to 1% of their investment",
                style: TextStyle(
                    fontSize: size.height * 0.0225,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: size.height * 0.2,
            ),
            GestureDetector(
              onTap: (() {
                pageController.changePage(pages.referFriend);
              }),
              child: const GeneralButton(
                  color: Color(0xfffeb808), text: "REFER A FRIEND!"),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            GestureDetector(
               onTap: (() {
                pageController.changePage(pages.dashboard);
              }),
              //wQJ0HXbbYe
              child: const GeneralButton(
                  color: Color(0xfffeb808), text: "REFFERAL DASHBOARD"),
            ),
          ],
        ),
      ),
    );
  }
}
