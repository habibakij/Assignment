
import 'dart:convert';
import 'package:assignment/util/api.dart';
import 'package:assignment/util/constant.dart';
import 'package:assignment/view/messagescreen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  @override
  void onInit(){
    super.onInit();
    _getDomain();
  }


  var domainMember= [].obs;
  RxString domainID= ''.obs;
  RxString domainName= ''.obs;
  _getDomain() async{
    EasyLoading.show();
    try{
      var response = await http.get(Uri.parse(Api.domain+"?page=1"));
      if(response.statusCode == 200 || response.statusCode == 201){
        EasyLoading.dismiss();
        var decode = jsonDecode(response.body);
        print("domain_response: ${decode.toString()}");
        domainMember.value= decode['hydra:member'];
        for(dynamic item in domainMember.value){
          domainID.value= item['id'];
          domainName.value= item['domain'];
        }
        print('check_domain: $domainID and $domainName');
      } else{
        EasyLoading.dismiss();
        Constant.customToast("Internal error occur, please try again");
      }
    } catch(exception){
      EasyLoading.dismiss();
      Constant.customToast("Internal error occur, please try again");
      print("error__: ${exception.toString()}");
    }
  }

  RxBool loginVisibility= true.obs;
  RxString accountID= ''.obs;
  RxString accountAddress= ''.obs;
  void createAccount(String userName, String password, String id) async{
    Map data = {
      'address': userName+'@'+domainName.value,
      'password': password,
    };
    String body = json.encode(data);
    EasyLoading.show();
    try{
      await http.post(Uri.parse(Api.accounts),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
        },
        body: body,
      ).then((response){
        print('post_data: '+userName+"@"+domainName.value.toString() +' password: '+password);
        print('account_response: '+response.body.toString());
        if(response.statusCode == 200 || response.statusCode == 201){
          EasyLoading.dismiss();
          var decode= json.decode(response.body);
          print('check_decode_acc: ${decode.toString()}');
          accountID.value= decode['id'];
          accountAddress.value= decode['address'];
          print('check_account: $accountID and $accountAddress');
          loginVisibility.value= false;
          getToken(accountAddress.value, password);
        } else{
          EasyLoading.dismiss();
          Constant.customToast("Internal error occur, please try again");
        }
      });
    }catch(exception){
      EasyLoading.dismiss();
      Constant.customToast("Internal error occur, please try again");
      print('error__: ${exception.toString()}');
    }
  }


  RxString token= ''.obs;
  void getToken(String address, String password) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      'address': address,
      'password': password,
    };
    String tokenBody = json.encode(data);
    EasyLoading.show();
    try{
      await http.post(Uri.parse(Api.token),
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
        },
        body: tokenBody,
      ).then((response){
        print('token_response: '+response.body.toString());
        if(response.statusCode == 200 || response.statusCode == 201){
          EasyLoading.dismiss();
          var decode= json.decode(response.body);
          token.value= decode['token'];
          print('check_token: $token');
          prefs.setString('token', token.value.toString());
          Get.to(MessageScreen());
        } else{
          EasyLoading.dismiss();
          Constant.customToast("Internal error occur, please try again");
        }
      });
    }catch(exception){
      EasyLoading.dismiss();
      Constant.customToast("Internal error occur, please try again");
      print('error__: ${exception.toString()}');
    }
  }

}