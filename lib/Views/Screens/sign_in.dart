import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/Controllers/auth_controller.dart';
import 'package:refferalapp/Controllers/user_controller.dart';

import '../../Controllers/page_controller.dart';
import '../../Controllers/user_controller.dart';
import '../reusables/general_button.dart';
import '../reusables/text_enter.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final pageController = Get.find<MyPageController>();
    final authController = Get.find<AuthController>();
    final userController = Get.find<UserController>();
    Size size = MediaQuery.of(context).size;
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
                TextEnter(hintText: 'Email', controller: emailController),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.02, bottom: size.height * 0.04),
                  child: TextEnter(
                      hintText: 'Password', controller: passwordController),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () async {
                      BotToast.showLoading();
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        BotToast.showText(text: "Email/Password not entered");
                      }
                      final response = await authController.login(
                          emailController.text, passwordController.text);
                      if (response.containsKey(true)) {
                       await userController.fetchUser(emailController.text); 
                       pageController.changePage(pages.loginSuccess);
                        BotToast.showText(
                            text: "LOGIN SUCCESSFULL",
                            contentColor: Colors.green);
                        BotToast.closeAllLoading();
                      }
                      if (response.containsKey(false)) {
                        BotToast.showText(
                            text: response[false].toString(),
                            contentColor: Colors.red);
                        BotToast.closeAllLoading();
                      }
                    },
                    child: const GeneralButton(
                        color: Color(0xfffeb803), text: "Login")),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.2, bottom: size.height * 0.02),
                  child: const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      pageController.changePage(pages.register);
                    },
                    child: const GeneralButton(
                        color: Color(0xff28334a), text: "Register")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
