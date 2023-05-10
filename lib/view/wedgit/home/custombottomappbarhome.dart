import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/controller/homescreen_controller.dart';
import 'package:glredeliveryapp/view/wedgit/home/custombottomappbar.dart';




class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) => BottomAppBar(
      height: 80,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          ...List.generate(
              controller.listPage.length + 1, ((index) {
            int i = index >2 ? index -1 : index;
            return
              index == 2 ? const Spacer() :
              Expanded(
                child: CustomButtonAppBar(
                  textBottom: controller.bottomAppbar[i]['title'],
                  iconData: controller.bottomAppbar[i]['icon'],
                  onPressed: () {controller.changePage(i);} ,
                  active: controller.currentpage == i ? true : false,
                ),
              );
          }
          ))
        ],
      ),
    ));
  }
}



