import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterControler extends GetxController {
  var counter = 0.obs;
  
  void incrementCounter() {
  counter++;
  } 

  void decrementCounter() {
  counter--;
  }

  void getsnackbar() {
    Get.snackbar(
      'GetX', 
      'ini snackbar', 
      colorText: Colors.white,
      backgroundColor: Colors.pinkAccent[400],
    );
  }
  void getdialog() {
    Get.defaultDialog(
      title: 'Get X Dialog',
      middleText: 'ini dialog',
    );
  }
  void getbottomsheet() {
    Get.bottomSheet(
      Container(
      height: 70,
      width: double.infinity,
      color: Colors.amber,
      child: Text('ini bottomsheet'),
    )
  );
  } 
}