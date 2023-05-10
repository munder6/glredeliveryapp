
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/controller/onboarding_controller.dart';
import 'package:glredeliveryapp/core/constant/color.dart';
import 'package:glredeliveryapp/data/static/static.dart';



class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                onBoardingList.length,
                    (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(right: 5),
                  duration: const Duration(milliseconds: 600),
                  width: controller.currentPage == index ? 20 : 5,
                  height: 6,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ))
          ],
        ));
  }
}