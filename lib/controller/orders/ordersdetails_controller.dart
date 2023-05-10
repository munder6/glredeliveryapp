

import 'dart:async';

import 'package:get/get.dart';
import 'package:glredeliveryapp/core/class/statusrequest.dart';
import 'package:glredeliveryapp/core/functions/handlingdatacontroller.dart';
import 'package:glredeliveryapp/data/model/cartmodel.dart';
import 'package:glredeliveryapp/data/model/ordersmodel.dart';
import 'package:glredeliveryapp/data/remote/ordersdetails_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {

  late OrdersModel ordersModel ;

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  CameraPosition? cameraPosition ;
  late Completer<GoogleMapController> completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  initialData(){
    completercontroller = Completer<GoogleMapController>();
    if(ordersModel.ordersType == "0"){
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat!),double.parse(ordersModel.addressLong!)),
      zoom: 14.4746,
    );
    markers.add(Marker(markerId: MarkerId("1") , position: LatLng(double.parse(ordersModel.addressLat!),double.parse(ordersModel.addressLong!))));
  }}


  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel.ordersId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

}