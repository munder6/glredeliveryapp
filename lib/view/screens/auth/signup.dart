import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/controller/auth/signup_controller.dart';
import 'package:glredeliveryapp/core/class/handlingdataview.dart';
import 'package:glredeliveryapp/core/constant/color.dart';
import 'package:glredeliveryapp/core/functions/alertexitapp.dart';
import 'package:glredeliveryapp/core/functions/validinput.dart';
import 'package:glredeliveryapp/view/wedgit/auth/custombuttonauth.dart';
import 'package:glredeliveryapp/view/wedgit/auth/customtextbodyauth.dart';
import 'package:glredeliveryapp/view/wedgit/auth/customtextformauth.dart';
import 'package:glredeliveryapp/view/wedgit/auth/customtexttitleauth.dart';
import 'package:glredeliveryapp/view/wedgit/auth/logoauth.dart';



class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title:  Text("13".tr, style: Theme.of(context).textTheme.headline1!.copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
    onWillPop: alertExitApp,
    child:
    GetBuilder<SignUpControllerImp>(builder: (controller) =>
    HandlingDataRequest(
    statusRequest : controller.statusRequest,
    widget :
        Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15 ,horizontal: 35),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              const LogoAuthSignUp(),
              //const SizedBox(height: 20,),
              CustomTextTitleAuth(text: "19".tr,),
              const SizedBox(height: 15,),
              CustomTextBodyAuth(text: '20'.tr,),
              const SizedBox(height: 30,),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val){
                  return validInput(val!, 6, 11, "username");
                },
                hinttext: '15'.tr,
                labeltext: '14'.tr,
                iconData: Icons.person_outline,
                mycontroller: controller.username,
              ),
              CustomTextFormAuth(
                isNumber : false,
                valid: (val){
                  return validInput(val!, 5, 100, "email");
                },
                hinttext: '6'.tr,
                labeltext: '5'.tr,
                iconData: Icons.email_outlined,
                mycontroller: controller.email,
              ),
              CustomTextFormAuth(
                isNumber: true,
                valid: (val){
                  return validInput(val!, 10, 10, "phone");

                },
                hinttext: '17'.tr,
                labeltext: '16'.tr,
                iconData: Icons.phone_android_outlined,
                mycontroller: controller.phone,
              ),
              CustomTextFormAuth(
                isNumber : false,
                valid: (val){
                  return validInput(val!, 6, 64, "password");
                },
                hinttext: '7'.tr,
                labeltext: '8'.tr,
                iconData: Icons.lock_outline_rounded,
                mycontroller: controller.password,
              ),
              // Text(
              //   "9".tr,
              //   textAlign: TextAlign.end,
              // ),
              const SizedBox(height: 40,),
              CustomButtonAuth(
                  text: "21".tr,
                  onPressed: () {
                    controller.signUp();

                  }
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("18".tr),
                  const SizedBox(width: 3,),
                  InkWell(
                    onTap: (){
                      controller.goToSignIn();
                    },
                    child: Text("3".tr, style: const TextStyle(color: AppColor.primaryColor),),
                  )
                ],
              )
            ],
          ),
        ),
      ),),
    )));
  }
}
