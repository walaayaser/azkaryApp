import 'package:azkaryapp/azkar/ui/azkar_categores_screen.dart';
import 'package:azkaryapp/common/ui/widgets/item_home_column.dart';
import 'package:azkaryapp/core/uitls/functions_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colors = [
    const Color(0xff16a085),
    const Color(0xff2980b9),
    const Color(0xff2c3e50),
    const Color(0xffff7f50),
    const Color(0xff485460),
    const Color(0xffffc048),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // ! azkar section
        Expanded(
            child: GestureDetector(
          onTap: () {
            navToPage(context: context, page: const AzkarCategoresScreen());
          },
          child: Container(
              color: colors[0],
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20),
              child: ItemHomeColumn(
                  textStyle: _textStyle(color: Colors.white),
                  icon: "assets/images/img1.png",
                  text: "الآذكار")),
        )),
        // !قسم السبحة والادعية
        Expanded(
            child: Row(children: [
          Expanded(
              child: Container(
            color: colors[1],
            child: ItemHomeColumn(
                textStyle: _textStyle(color: Colors.white),
                icon: "assets/images/img1.png",
                text: "السبحة"),
          )),
          Expanded(
              child: Container(
            color: colors[2],
            child: ItemHomeColumn(
                textStyle: _textStyle(color: Colors.white),
                icon: "assets/images/img1.png",
                text: "الادعية"),
          ))
        ])),

        // ! قسم الصلاة والاذان
        Expanded(
            child: Container(
          width: double.infinity,
          color: colors[3],
          child: ItemHomeColumn(
              textStyle: _textStyle(color: Colors.white),
              icon: "assets/images/img1.png",
              text: "الصلاة والآذان"),
        )),
        // !قسم  الاحاديث واسماء الله الحسني
        Expanded(
            child: Row(children: [
          Expanded(
              child: Container(
            color: colors[4],
            child: ItemHomeColumn(
                textStyle: _textStyle(color: Colors.white),
                icon: "assets/images/img1.png",
                text: "الاحاديث"),
          )),
          Expanded(
              child: Container(
            color: colors[5],
            child: ItemHomeColumn(
                textStyle: _textStyle(color: Colors.white),
                icon: "assets/images/img1.png",
                text: "اسماءالله الحسني"),
          ))
        ]))
      ],
    ));
  }

  TextStyle _textStyle({color}) {
    return GoogleFonts.tajawal(
        fontSize: 35, fontWeight: FontWeight.bold, color: color);
  }
}
