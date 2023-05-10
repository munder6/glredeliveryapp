import 'dart:io';

checkInternet() async {
  try{
     var results = await InternetAddress.lookup("google.com");
     if (results.isNotEmpty && results[0].rawAddress.isNotEmpty){
       return true;
     }
  } on SocketException catch(_){
    return false;
  }
}