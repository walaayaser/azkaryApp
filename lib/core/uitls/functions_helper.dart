import 'dart:convert';

import 'package:azkaryapp/azkar/models/azkar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

navToPage({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

List<AzkarModel> azkares = [];
Future<void> readJson() async {
  final String response =
      await rootBundle.loadString('assets/fils/adhkar.json');
  final data = await json.decode(response);

  for (var item in data) {
    azkares.add(AzkarModel.fromJson(item));
  }

  debugPrint(azkares.length.toString());

}



displayToast(String msg, Color color) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
