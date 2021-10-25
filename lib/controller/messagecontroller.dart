
import 'dart:convert';
import 'package:assignment/util/api.dart';
import 'package:assignment/util/constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MessageController extends GetxController {

  @override
  void onInit(){
    super.onInit();
    getMessage();
  }

  List messageList= [].obs;
  List messageTo= [].obs;
  RxString messageId= ''.obs, messageSub= ''.obs, messageInto= ''.obs, fromAddress= ''.obs,
      toAddress= ''.obs, fromName= ''.obs, toName= ''.obs;
  final totalItem= 0.obs;
  late Map<String, dynamic> map;
  void getMessage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token= prefs.getString('token');
    EasyLoading.show();
    try{
      var response = await http.get(Uri.parse(Api.message),
        headers:{
          'Authorization': 'Bearer $token'
        },
      );
      print('message_response: '+response.body.toString() +'token: $token');
      if(response.statusCode == 200 || response.statusCode == 201){
        EasyLoading.dismiss();
        var decode= jsonDecode(response.body);
        messageList= decode['hydra:member'];
        totalItem.value= decode['hydra:totalItems'];
        for(dynamic item in messageList){
          messageId.value= item['id'];
          messageSub.value= item['subject'];
          messageInto.value= item['intro'];
          messageTo= item['to'];
          for(dynamic item in messageTo){
            toAddress.value= item['address'];
            toName.value= item['name'];
          }
          map= item['from'];
          fromAddress.value= map['address'];
          fromName.value= map['name'];
          print('check_map: $map');
        }
      } else{
        EasyLoading.dismiss();
        Constant.customToast("Internal error occur, please try again");
      }
    } catch(exception){
      EasyLoading.dismiss();
      Constant.customToast("Internal error occur, please try again");
      print('error__: ${exception.toString()}');
    }

  }


}