import 'dart:math';

import 'package:azkaryapp/azkar/models/azkar_model.dart';
import 'package:azkaryapp/azkar/ui/azkar_screen.dart';
import 'package:azkaryapp/core/styles/colors.dart';
import 'package:azkaryapp/core/uitls/functions_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Color> colors = [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
  Colors.purpleAccent,
  Colors.orangeAccent,
  Colors.pinkAccent,
  Colors.tealAccent,
  Colors.yellowAccent,
  Colors.indigoAccent,
  Colors.limeAccent,
  Colors.cyanAccent,
  Colors.amberAccent,
  Colors.deepOrangeAccent,
  Colors.deepPurpleAccent,
  Colors.lightBlueAccent,
  Colors.lightGreenAccent,
  Colors.brown,
  Colors.grey,
  Colors.indigo,
];

class AzkarCategoresScreen extends StatelessWidget {
  const AzkarCategoresScreen({super.key});

  // ! random color
  Color _randomColor() {
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.backgroundColor,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          "  قائمة الأذكار",
          style: GoogleFonts.cairo(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: GridView.builder(
          itemCount: azkares.length,
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 150,
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            AzkarModel azkarModel = azkares[index];

            return GestureDetector(
              onTap: () {
                navToPage(
                    context: context,
                    page: AzkarScreen(azkarModel: azkarModel));
              },
              child: Container(
                height: 80,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  // ! random color
                  color: _randomColor().withOpacity(.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  azkarModel.category!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            );
          }),
    );
  }
}
