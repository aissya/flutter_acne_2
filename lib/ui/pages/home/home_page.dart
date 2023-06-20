import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
//import 'package:flutter_acne/ui/pages/preview_scan_page.dart';
//import 'package:flutter_acne/ui/pages/loading_page.dart';
import 'package:flutter_acne/ui/pages/TfliteModel.dart';
import 'package:flutter_acne/ui/widgets/article_home_tile.dart';
//import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            builder: (contex) => TfliteModel(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: bgColor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/about-us');
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(50),
                      right: getProportionateScreenWidth(25),
                    ),
                    child: Image.asset(
                      'assets/about_me_acne2.png',
                      width: getProportionateScreenWidth(30),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(11),
                left: getProportionateScreenWidth(25),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mooi Skin',
                        style: aclonicaTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: weightBold,
                          color: greenColor,
                        ),
                      ),
                      Text(
                        '"Acne may show up, \n but it doesnt define \n who you really are."',
                        style: aclonicaTextStyle.copyWith(
                          fontSize: 15,
                          height: 1.3,
                          fontWeight: weightBold,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      'assets/splash_girl_3.png',
                      width: getProportionateScreenWidth(160),
                      height: getProportionateScreenHeight(176),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(700),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Check your skin section
                  Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(30),
                      left: getProportionateScreenWidth(30),
                      right: getProportionateScreenWidth(30),
                      bottom: getProportionateScreenHeight(42),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOREM',
                          style: aclonicaTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: weightBold,
                            color: greenColor,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (() => getImage(ImageSource.camera)),
                              child: Image.asset(
                                'assets/camera_yellow.png',
                                width: getProportionateScreenWidth(145),
                                height: getProportionateScreenHeight(130),
                              ),
                            ),
                            GestureDetector(
                              onTap: (() => getImage(ImageSource.gallery)),
                              child: Image.asset(
                                'assets/galeri_yellow.png',
                                width: getProportionateScreenWidth(145),
                                height: getProportionateScreenHeight(130),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Line section
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(
                        23,
                      ),
                    ),
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xFFE5E5E5),
                  ),
                  // Articles section
                  Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(30),
                          ),
                          child: Text(
                            'LOREM',
                            style: aclonicaTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: weightBold,
                              color: greenColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(30),
                            right: getProportionateScreenWidth(30),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/bg_penggunaan.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: getProportionateScreenWidth(26),
                              ),
                              ArticleHomeTile(
                                id: 0,
                                image: 'assets/icon_home.png',
                              ),
                              ArticleHomeTile(
                                id: 1,
                                image: 'assets/icon_home.png',
                              ),
                              ArticleHomeTile(
                                id: 2,
                                image: 'assets/icon_home.png',
                              ),
                              ArticleHomeTile(
                                id: 3,
                                image: 'assets/icon_home.png',
                              ),
                              ArticleHomeTile(
                                id: 4,
                                image: 'assets/icon_home.png',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
