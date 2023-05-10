

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/view/screens/homescreen.dart';
import 'package:glredeliveryapp/view/screens/orders/ordersaccepted.dart';
import 'package:glredeliveryapp/view/screens/orders/orderspinding.dart';

abstract class HomeScreenController extends GetxController{

  changePage(int currentpage);

}

class HomeScreenControllerImp extends HomeScreenController{

  int currentpage =0;

  List<Widget> listPage = [
    const OrdersPendingScreen(),
    const OrdersAcceptedScreen(),
    const Text("Ho"),
  ];

  List bottomAppbar = [
    {
      "title" : "Home",
      "icon" : Icons.access_time_filled
    },
    {
      "title" : "Notifications",
      "icon" : Icons.done_outline_sharp
    },
    {
      "title" : "Setting",
      "icon" : Icons.settings
    },
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

}