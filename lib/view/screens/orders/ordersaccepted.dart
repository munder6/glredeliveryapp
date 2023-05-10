import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/controller/orders/ordersaccepted_controller.dart';
import 'package:glredeliveryapp/core/class/handlingdataview.dart';
import 'package:glredeliveryapp/core/constant/color.dart';
import 'package:glredeliveryapp/view/wedgit/order/customordercardlist.dart';
import 'package:glredeliveryapp/view/wedgit/order/customorderslistaccepted.dart';


class OrdersAcceptedScreen extends StatelessWidget {
  const OrdersAcceptedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Scaffold(
      appBar: AppBar(
        title:  Text("106".tr , style: const TextStyle(color: AppColor.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColor.white,
        iconTheme: const IconThemeData(color: AppColor.black),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersAcceptedController>(
          builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: ((context , index) =>  OrdersCardListAccepted(listdata: controller.data[index],) ),
          )),
        ) ,
      ),
    );
  }
}




