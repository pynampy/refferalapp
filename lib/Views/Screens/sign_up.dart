import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/auth_controller.dart';
import '../../Controllers/page_controller.dart';
import '../reusables/general_button.dart';
import '../reusables/text_enter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final refController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pageController = Get.find<MyPageController>();
    final authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.1),
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                  width: size.width * 0.5,
                ),
                TextEnter(hintText: 'Name', controller: nameController),
                SizedBox(height: size.height * 0.02),
                TextEnter(hintText: 'Email', controller: emailController),
                SizedBox(height: size.height * 0.02),
                TextEnter(hintText: 'Password', controller: passwordController),
                SizedBox(height: size.height * 0.02),
                TextEnter(hintText: 'Refferal Code', controller: refController),
                SizedBox(height: size.height * 0.02),
                const Spacer(),
                GestureDetector(
                    onTap: () async {
                      BotToast.showLoading();
                      final response = await authController.register(
                          nameController.text,
                          emailController.text,
                          passwordController.text,
                          refController.text);

                      if (response.containsKey(true)) {
                        BotToast.showText(
                            text: "REGISTRATION SUCCESSFULL",
                            contentColor: Colors.green);
                        BotToast.closeAllLoading();
                        pageController.changePage(pages.registerSuccess);
                      }
                      if (response.containsKey(false)) {
                        BotToast.showText(
                            text: response[false].toString(),
                            contentColor: Colors.red);
                        BotToast.closeAllLoading();
                      }

                    },
                    child: const GeneralButton(
                        color: Color(0xfffeb803), text: "Register")),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.2, bottom: size.height * 0.02),
                  child: const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      pageController.changePage(pages.login);
                    },
                    child: const GeneralButton(
                        color: Color(0xff28334a), text: "Login")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
