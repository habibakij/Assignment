
import 'package:assignment/controller/messagecontroller.dart';
import 'package:assignment/util/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class MessageScreen extends StatelessWidget {

  var messageController= Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    Constant.dynamicScreen(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Message",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.refresh,
                  ),
                ),
                onTap: (){
                  Constant.customToast('Refresh');
                  messageController.getMessage();
                },
              ),
            ],
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          color: HexColor("#f2f2f2"),
          child: Center(
            child: Card(
              shadowColor: Colors.red,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                width: Constant.mainContainerWidth,
                margin: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: Constant.mainContainerWidth,
                      color: Colors.blue[50],
                      height: 30,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: [

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Text(
                              'Message Id',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Obx(() => Text(
                              messageController.messageId.value == "" ? "Empty" : messageController.messageId.value.toString(),
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: Constant.mainContainerWidth,
                      color: Colors.red[50],
                      height: 30,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: [

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Text(
                              'Message Sub',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Obx(() => Text(
                              messageController.messageSub.value == "" ? "Empty" : messageController.messageSub.value.toString(),
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(fontSize: 14),
                            ),),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      width: Constant.mainContainerWidth,
                      color: Colors.blue[50],
                      height: 30,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: [

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Text(
                              'Message Into',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Obx(() => Text(
                              messageController.messageInto.value == "" ? "Empty" : messageController.messageInto.value.toString(),
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(fontSize: 14),
                            ),),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: Constant.mainContainerWidth,
                      color: Colors.red[50],
                      height: 30,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: [

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Text(
                              'Message From',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Obx(() => Text(
                              messageController.fromAddress.value == "" ? "Empty" : messageController.fromAddress.value.toString(),
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(fontSize: 14),
                            ),),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: Constant.mainContainerWidth,
                      color: Colors.blue[50],
                      height: 30,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: [

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Text(
                              'Sender Name',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Obx(() => Text(
                              messageController.fromName.value == "" ? "Empty" : messageController.fromName.value.toString(),
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(fontSize: 14),
                            ),),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: Constant.mainContainerWidth,
                      color: Colors.red[50],
                      height: 30,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: [

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Text(
                              'Message To',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Obx(() => Text(
                              messageController.toAddress.value == "" ? "Empty" : messageController.toAddress.value.toString(),
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(fontSize: 14),
                            ),),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: Constant.mainContainerWidth,
                      color: Colors.blue[50],
                      height: 30,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: [

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Text(
                              'Receiver Name',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Obx(() => Text(
                              messageController.toName.value == "" ? "Empty" : messageController.toName.value.toString(),
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(fontSize: 14),
                            ),),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      width: Constant.mainContainerWidth,
                      color: Colors.blue[50],
                      height: 30,
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: [

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Text(
                              'Total Inbox',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),

                          Container(
                            width: Constant.containerHalfWidth,
                            child: Obx(() => Text(
                              messageController.totalItem == 0 ? "Empty" : messageController.totalItem.toString(),
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(fontSize: 14),
                            ),),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
