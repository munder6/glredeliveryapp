import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glredeliveryapp/controller/home_controller.dart';
import 'package:glredeliveryapp/core/constant/color.dart';
import 'package:glredeliveryapp/core/functions/translatedatabase.dart';
import 'package:glredeliveryapp/data/model/categoriesmodel.dart';
import 'package:glredeliveryapp/linkapi.dart';




class CustomCatHome extends GetView<HomeControllerImp> {

  const CustomCatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 70,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 1,),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Categories(
            i : index,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),) ;
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {

  final CategoriesModel categoriesModel;
  final int? i;
  const Categories( {Key? key, required this.categoriesModel, required this.i,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToItems(controller.categories, i! , categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
        Card(
        elevation: 5,
          shadowColor: AppColor.black.withOpacity(0.3),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              width: 130,
              child:
              Row(
                children: [
                  SvgPicture.network(
                      "${AppLink.imageCategories}/${categoriesModel.categoriesImage}" , width: 35,
                  ),
                  const SizedBox(width: 7),
                  Text("${translateDtaBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}")
                ],
              ),
            ),
          )],
      ),
    );
  }
}


// Container(
// decoration: BoxDecoration(
//
// borderRadius: BorderRadius.circular(12),
//
// color: AppColor.threeColor,
// ),
// padding: const EdgeInsets.symmetric(horizontal: 5),
// height: 64.5,
// width: 64.5,
// child:
// SvgPicture.network(
// "${AppLink.imageCategories}/${categoriesModel.categoriesImage}"
// ),
// ),
// const SizedBox(height: 3,),
// Text("${translateDtaBase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}")

