import 'package:azkaryapp/azkar/models/azkar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/uitls/functions_helper.dart';

class AzkarScreen extends StatefulWidget {
  final AzkarModel azkarModel;
  const AzkarScreen({super.key, required this.azkarModel});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int count = 1;
  int readCount = 0;
  int currentIndex = 0;

  _addReading() {
    readCount++;
    if (readCount >= count) {
      readCount = 0;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    count = widget.azkarModel.array![0].count!;
    readCount = count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(
          widget.azkarModel.category!,
          style: GoogleFonts.cairo(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("${widget.azkarModel.array!.length}",
                style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          //! icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(
                      text: widget.azkarModel.array![currentIndex].text!));

                  displayToast("تم نسخ الاذكار", Colors.green);
                },
                icon: const Icon(Icons.copy),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.light_mode_rounded),
                color: Colors.white,
              ),
              Text(
                "$count",
                style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 1,
            color: Colors.white,
          ),

          Expanded(
              child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
                count = widget.azkarModel.array![value].count!;
              });
            },
            children: widget.azkarModel.array!
                .map((e) => GestureDetector(
                      onTap: () {
                        _addReading();
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "$readCount",
                                style: const TextStyle(
                                    color: Color.fromARGB(91, 255, 255, 255),
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(49, 0, 0, 0)),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40, left: 20, right: 20, bottom: 30),
                                  child: Text(
                                    e.text!,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        height: 2.5,
                                        wordSpacing: 5,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}
