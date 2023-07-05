import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_acne/provider/article_page_provider.dart';
// import 'package:flutter_acne/provider/page_provider.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/ui/pages/home/article_page.dart';
import 'package:flutter_acne/ui/pages/home/home_page.dart';
//import 'package:flutter_acne/ui/pages/home/camera_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_acne/ui/pages/preview_scan_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  //state mainpage
  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  int _currentindex = 0;

  late File image;
  final picker = ImagePicker();

  Future getImage(source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        var state = 1;
        if (source == ImageSource.camera) {
          state = 2;
        } else {
          state = 1;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => PreviewScan(
              image: image,
              state: state,
            ),
          ),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  List pages = [HomePage(), HomePage(), ArticlePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentindex],
        bottomNavigationBar: ConvexAppBar(
            style: TabStyle.fixedCircle,
            backgroundColor: pinkColor,
            activeColor: yellowColor,
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.camera, title: 'Camera'),
              TabItem(icon: Icons.article, title: 'Artikel'),
            ],
            initialActiveIndex: 0, //optional, default as 0
            onTap: (int i) {
              setState(() {
                _currentindex = i;
                if (i == 1) {
                  getImage(ImageSource
                      .camera); // Panggil metode saat ikon kamera diklik
                }
              });
            }));
  }
}
