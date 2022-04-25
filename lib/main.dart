import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refferalapp/Controllers/page_controller.dart';
import 'package:refferalapp/Controllers/user_controller.dart';
import 'package:refferalapp/Views/Screens/home_screen.dart';

import 'Controllers/auth_controller.dart';
import 'Views/Screens/main_auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyPageController());
    Get.put(AuthController());
    Get.put(UserController());
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainAuthPage(),//const MainAuthPage(),
    );
  }
}
