import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/page_controller.dart';
import '../reusables/general_button.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = Get.find<MyPageController>();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        //  Container(child: Image.asset('assets/sign_up.jpg')),
        Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.33, bottom: size.height * 0.075),
                height: size.height * 0.12,
                width: size.height * 0.12,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xfffeb808)),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: size.height * 0.06,
                ),
              ),
              Container(
                height: size.height * 0.35,
                width: size.width * 0.9,
                padding: EdgeInsets.all(size.height * 0.04),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.height * 0.02)),
                child: Column(
                  children: [
                    Text(
                      "Account Created",
                      style: TextStyle(
                          color: const Color(0xfffeb808),
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.03),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.02),
                      child: const Text(
                        "Your account had beed created successfully",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xff8A8D9F)),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        pageController.changePage(pages.login);
                      },
                      child: const GeneralButton(
                          color: Color(0xfffeb808), text: "Take me to sign in"),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
