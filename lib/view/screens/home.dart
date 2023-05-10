import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/controller/homescreen_controller.dart';
import 'package:glredeliveryapp/core/constant/color.dart';
import 'package:glredeliveryapp/core/constant/routes.dart';
import 'package:glredeliveryapp/view/wedgit/home/custombottomappbarhome.dart';




class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) => Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBarHome(),
      // appBar: AppBar(
      //   title:  Text("153".tr, style: const TextStyle(color: AppColor.black),),
      //   centerTitle: true,
      //   backgroundColor: AppColor.white,
      //   elevation: 0,
      // ),
      body: WillPopScope(child: controller.listPage.elementAt(controller.currentpage) ,
          onWillPop: (){
        Get.defaultDialog(title: "39".tr,
            middleText: "40".tr,
            onCancel: (){} ,
            textConfirm: "41".tr,
            textCancel: "42".tr,
            cancelTextColor: AppColor.secondColor,
            confirmTextColor: AppColor.white,
            buttonColor: AppColor.red,
            onConfirm: (){exit(0);
        });
        return Future.value(false);
          }
      ),
      // bottomNavigationBar: ,
    ));
  }
}
