import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum pages {
  login,
  register,
  registerSuccess,
  loginSuccess,
  referFriend,
  dashboard
}


class MyPageController extends GetxController {

  var currentPage = pages.login.obs;

  void changePage(pages type){
    
    if(type == pages.login) currentPage.value = pages.login;
    if(type == pages.register) currentPage.value = pages.register;
    if(type == pages.registerSuccess) currentPage.value = pages.registerSuccess;
    if(type == pages.loginSuccess) currentPage.value = pages.loginSuccess;
    if(type == pages.referFriend) currentPage.value = pages.referFriend;
    if(type == pages.dashboard) currentPage.value = pages.dashboard;


  }


}