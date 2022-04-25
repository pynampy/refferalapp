import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/Views/Screens/auth_success.dart';
import 'package:refferalapp/Views/Screens/dashboard.dart';
import 'package:refferalapp/Views/Screens/home_screen.dart';
import 'package:refferalapp/Views/Screens/refer_friend.dart';
import 'package:refferalapp/Views/Screens/sign_in.dart';
import '../../Controllers/page_controller.dart';
import 'sign_up.dart';

class MainAuthPage extends StatelessWidget {
  const MainAuthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = Get.find<MyPageController>();
    return GetX<MyPageController>(builder: (_){
      if(pageController.currentPage.value == pages.login) return SignInScreen();
      if(pageController.currentPage.value == pages.register) return SignUpScreen();
      if(pageController.currentPage.value == pages.registerSuccess) return const RegisterSuccess();
      if(pageController.currentPage.value == pages.loginSuccess) return const HomeScreen();
      if(pageController.currentPage.value == pages.referFriend) return const ReferFriend();
      if(pageController.currentPage.value == pages.dashboard) return const Dashboard();
      return SignInScreen();
    });
  }
}