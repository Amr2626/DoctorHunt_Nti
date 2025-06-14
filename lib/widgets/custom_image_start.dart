import 'package:flutter/material.dart';

class ImageStart extends StatefulWidget {
  const ImageStart({super.key});

  @override
  ImageStartState createState() => ImageStartState();
}

class ImageStartState extends State<ImageStart> {
  int currentImageIndex = 0;
final List<String> images = [
    'assets/Ellipse 154.png',
    'assets/Ellipse 154-2.png',
    'assets/Ellipse 154-3.png',
  ];

  void changeImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: changeImage,
        child: CircleAvatar(
          radius: 170,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(images[currentImageIndex]),
        ),
      ), 
    );
  }
}
