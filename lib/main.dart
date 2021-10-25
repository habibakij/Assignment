
import 'package:assignment/controller/logincontroller.dart';
import 'package:assignment/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController userNameController= new TextEditingController();
  TextEditingController passwordController= new TextEditingController();

  LoginController loginController= Get.put(LoginController());
  bool _isShowingPassword = false;

  @override
  void initState() {
    super.initState();
    Constant.configEasyLoading();
  }

  @override
  Widget build(BuildContext context) {
    Constant.dynamicScreen(context);
    return Scaffold(
      /*appBar: AppBar(
        title: Text(widget.title),
      ),*/
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: Constant.mainContainerWidth,
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(8),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Card(
                  color: Colors.grey[100],
                  margin: EdgeInsets.only(left: 20, right: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [

                        ///username text field container
                        Container(
                          height: 70,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: TextFormField(
                            controller: userNameController,
                            decoration: InputDecoration(
                              labelText: "user name",
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                fontFamily: "",
                                fontSize: 12,
                              ),
                              prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.blue[800]
                              ),
                            ),
                          ),
                        ),

                        ///Password text field container
                        Container(
                          height: 70,
                          margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !_isShowingPassword,
                            decoration: InputDecoration(
                              labelText: "password",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: TextStyle(
                                fontFamily: "",
                                fontSize: 12,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(!_isShowingPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                    color: Colors.blue[800]),
                                onPressed: () {
                                  setState(() {
                                    _isShowingPassword = !_isShowingPassword;
                                  });
                                },
                              ),
                              prefixIcon:
                              Icon(Icons.vpn_key, color: Colors.blue[800]),
                            ),
                          ),
                        ),

                        Container(
                          height: 40,
                          width: 150,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.only(top: 10),
                          child: FlatButton(
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Create an Account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                              ),
                            ),
                            onPressed: () {
                              loginController.createAccount(userNameController.text.toString(), passwordController.text.toString(), loginController.domainID.value);
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
