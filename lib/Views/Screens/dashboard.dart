import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/Controllers/page_controller.dart';

import '../../Controllers/user_controller.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                  onTap: () {
                    pageController.changePage(pages.loginSuccess);
                  },
                  child: Icon(Icons.arrow_back)),
              Text(
                "Referral Dashboard",
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
            Text("TOTAL CASH EARNED:",
                style: TextStyle(
                    fontSize: size.height * 0.0225,
                    fontWeight: FontWeight.w600)),
            SizedBox(
              height: size.height * 0.02,
            ),
            Obx(() {
              var points = userController.currentUser.value == null
                  ? "#######"
                  : userController.currentUser.value!.points;
              return Text(points,
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.w700));
            }),
            Container(
              height: 2,
              width: size.width * 0.9,
              color: Colors.black,
            ),
            Container(
              height: size.height * 0.03,
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "NAME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "CASH",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              height: 2,
              width: size.width * 0.9,
              color: Colors.black,
            ),
            SizedBox(
              height: size.height * 0.4,
              child: Obx(() {
                var referrals;
                userController.currentUser.value == null
                    ? referrals = []
                    : referrals =
                        userController.currentUser.value!.refString.split(',');
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    for (var i = 0; i < referrals.length; i++)
                      if (referrals[i] != '')
                        Column(children: [
                          Container(
                            height: size.height * 0.03,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  referrals[i],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "50",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            width: size.width * 0.9,
                            color: Colors.black,
                          ),
                        ]),
                  ],
                );
              }),
            ),
            Text(
              "FAQ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.height * 0.02),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
         
              Text('What are the incentives for the referring a friend?'),
          SizedBox(
              height: size.height * 0.01,
            ),
            Row(children: [Text('When will I get my referral bonus?')]),
             SizedBox(
              height: size.height * 0.01,
            ),
            Row(children: [Text('Where will I receive this bonus?')])
          ],
        ),
      ),
    );
  }
}
