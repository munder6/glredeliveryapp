import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:glredeliveryapp/core/constant/routes.dart';
import 'package:glredeliveryapp/core/middleware/mymiddleware.dart';
import 'package:glredeliveryapp/view/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:glredeliveryapp/view/screens/auth/forgetpassword/resetpassword.dart';
import 'package:glredeliveryapp/view/screens/auth/forgetpassword/successresetpassword.dart';
import 'package:glredeliveryapp/view/screens/auth/forgetpassword/veryfiycode.dart';
import 'package:glredeliveryapp/view/screens/auth/forgetpassword/veryfiycodesignup.dart';
import 'package:glredeliveryapp/view/screens/auth/signup.dart';
import 'package:glredeliveryapp/view/screens/auth/success_signup.dart';
import 'package:glredeliveryapp/view/screens/home.dart';
import 'package:glredeliveryapp/view/screens/lang.dart';
import 'package:glredeliveryapp/view/screens/onboarding.dart';
import 'package:glredeliveryapp/view/screens/orders/orderdetails.dart';
import 'package:glredeliveryapp/view/screens/orders/ordersarchive.dart';
import 'package:glredeliveryapp/view/screens/orders/orderspinding.dart';
import 'package:glredeliveryapp/view/screens/orders/tracking.dart';
import 'view/screens/auth/login.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>? routes = [

  GetPage(name: "/", page: () => const Language(),middlewares: [MyMiddleware()]),
  //,middlewares: [MyMiddleware()]
  // GetPage(name: "/", page: () => const ProDetailsTest() ),
  //


  //GetPage(name: "/", page: ()=> const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.ForgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.VeryfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.ResetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.homeScreen, page: () => const Home()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveScreen()),
  GetPage(name: AppRoute.ordersPending, page: () => const OrdersPendingScreen()),
  GetPage(name: AppRoute.chooseLang, page: () => const Language()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrderDetails()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveScreen()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.ordersTracking, page: () => const OrderTracking()),

  
];
