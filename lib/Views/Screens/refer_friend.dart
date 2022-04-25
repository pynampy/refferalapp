import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:get/get.dart';
import 'package:refferalapp/Views/reusables/general_button.dart';

import '../../Controllers/page_controller.dart';
import '../../Controllers/user_controller.dart';

class ReferFriend extends StatelessWidget {
  const ReferFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userController = Get.find<UserController>();
    final pageController = Get.find<MyPageController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.075, horizontal: size.width * 0.075),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () {
                    pageController.changePage(pages.loginSuccess);
                  },
                  child: Icon(Icons.arrow_back)),
              Text(
                "Referral Section",
                style: TextStyle(
                    fontSize: size.height * 0.03, fontWeight: FontWeight.w600),
              ),
              const Icon(
                Icons.arrow_back,
                color: Colors.transparent,
              )
            ]),
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
            Text("Your refferal code is",
                style: TextStyle(
                    fontSize: size.height * 0.0225,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: size.height * 0.02,
            ),
            Obx(() {
              var code = userController.currentUser.value == null
                  ? "#######"
                  : userController.currentUser.value!.refCode;
              return Text(code,
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.w700));
            }),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Icon(
                Icons.share,
                size: size.height * 0.06,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      FacebookButton(
                        onPressed: () {},
                      ),
                      TwitterButton(
                        onPressed: () {},
                      ),
                      InstagramButton(
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      LinkedinButton(
                        onPressed: () {},
                      ),
                      GoogleButton(
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ]),
            SizedBox(
              height: size.height * 0.08,
            ),
            Text(
              "Hey, have you tried BHIVE.fund? I've been Investing with them and thought you’d love it too! ",
              style: TextStyle(
                  fontSize: size.height * 0.02, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "BHIVE.fund is one of India's largest and fastest-growing investment platforms.  ",
              style: TextStyle(
                  fontSize: size.height * 0.02, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Investing with them is fast & easy. Click on the link to start Investing.",
              style: TextStyle(
                  fontSize: size.height * 0.02, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
