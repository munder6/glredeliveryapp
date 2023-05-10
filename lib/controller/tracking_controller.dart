import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/core/class/statusrequest.dart';
import 'package:glredeliveryapp/data/model/ordersmodel.dart';
import 'package:glredeliveryapp/data/remote/ordersdetails_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class TrackingController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());
  GoogleMapController? gmc;
  StatusRequest statusRequest = StatusRequest.success;
  CameraPosition? cameraPosition ;
  late OrdersModel ordersModel ;

  double? destlat ;
  double? destlong ;

  double? currentlat ;
  double? currentlong ;





  List<Marker> markers = [];
  StreamSubscription<Position>? positionStream;



  getCurrentLocation(){
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat!),double.parse(ordersModel.addressLong!)),
      zoom: 14.4746,
    );
    markers.add(Marker(markerId: MarkerId("dest") ,
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!))));
    positionStream = Geolocator.getPositionStream().listen((Position? position) {
         print("=========================== current position");
         if(gmc != null){
           gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(currentlat!,currentlong!)));
         }
         markers.removeWhere((element) => element.markerId.value == "current");
         markers.add(Marker(markerId: MarkerId("current") ,
             position: LatLng(position!.latitude, position.longitude)));
         update();
        });
  }


  @override
  void onInit() {

    ordersModel = Get.arguments['ordersmodel'];
    getCurrentLocation();
    super.onInit();
  }
}