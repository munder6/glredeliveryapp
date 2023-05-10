

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/core/class/statusrequest.dart';
import 'package:glredeliveryapp/core/constant/routes.dart';
import 'package:glredeliveryapp/core/functions/handlingdatacontroller.dart';
import 'package:glredeliveryapp/data/auth/resetpassword.dart';

abstract class ResetPasswordController extends GetxController{
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  late TextEditingController password;
  late TextEditingController repassword;


  String? email;

  StatusRequest statusRequest = StatusRequest.none;





  @override
  resetpassword() {

  }

  @override
  goToSuccessResetPassword() async {

    if(password.text != repassword.text) {
      return Get.defaultDialog(title:"39".tr, middleText: "48".tr );
    }
    statusRequest = StatusRequest.loading;
    update() ;
    var response = await resetPasswordData.postdata(email!, password.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.successResetPassword );
      } else {
        Get.defaultDialog(title: "39".tr , middleText: "47".tr);
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();




    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }


}