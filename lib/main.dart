import 'dart:math'; // لاستيراد مكتبة الأرقام العشوائية
import 'package:flutter/material.dart';

class RandomImageScreen extends StatefulWidget {
  @override
  _RandomImageScreenState createState() => _RandomImageScreenState();
}

class _RandomImageScreenState extends State<RandomImageScreen> {
  // قائمة الصور
  final List<String> images = [
    'assets/butterfly-red-butterfly.gif',
    'assets/friday-weekend.gif',
    'assets/good-morning-animated-stickers.gif',
    'assets/good-morning-have-a-nice-day.gif',
    'assets/good-night-animated-stickers.gif',
    'assets/thanks-thank-you.gif',
  ];

  // متغير لحفظ الصورة العشوائية الحالية
  String? currentImage;

  // توليد رقم عشوائي واختيار الصورة
  void changeImage() {
    final random = Random();
    setState(() {
      currentImage = images[random.nextInt(images.length)];
    });
  }

  @override
  void initState() {
    super.initState();
    // تعيين صورة عشوائية مبدئية
    currentImage = images[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Image Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentImage != null
                ? Image.asset(
              currentImage!,
              height: 300,
              width: 300,
            )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeImage,
              child: Text('Show Random Image'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RandomImageScreen(),
  ));
}
