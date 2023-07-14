import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class Penggunaan extends StatefulWidget {
  const Penggunaan({Key? key}) : super(key: key);

  @override
  _PenggunaanState createState() => _PenggunaanState();
}

class _PenggunaanState extends State<Penggunaan> {
  _storeOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('screen', 0);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        toolbarHeight: getProportionateScreenHeight(60),
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(30)),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: pinkColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (() => Navigator.pop(context)),
                  child: Container(
                    margin:
                        EdgeInsets.only(left: getProportionateScreenWidth(10)),
                    child: const Icon(Icons.arrow_back_rounded,
                        size: 24, color: whiteColor),
                  )),
              Text(
                'Usage Instructions',
                style: opensansTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
              const SizedBox(width: 20)
            ],
          ),
        ),
      ),
      body: VsScrollbar(
        controller: _scrollController,
        showTrackOnHover: true, // default false
        isAlwaysShown: true,
        style: VsScrollbarStyle(
          color: bgColor,
          hoverThickness: 100.0,
          radius: Radius.circular(5),
          thickness: 7,
        ),

        child: ListView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
          children: [
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       //girl asset dan title
            //       Text(
            //         'Mooi Skin',
            //         style: aclonicaTextStyle.copyWith(
            //           fontSize: 30,
            //           fontWeight: weightBold,
            //           color: greenColor,
            //         ),
            //       ),
            //       Image.asset(
            //         'assets/splash_girl_3.png',
            //         width: getProportionateScreenWidth(120),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(40),
                left: getProportionateScreenWidth(25),
                right: getProportionateScreenWidth(25),
                bottom: getProportionateScreenWidth(40),
              ),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              'Berikut merupakan petunjuk penggunaan aplikasi Mooi Skin\n\n1.Buka pada halaman Home\n\n2.Pilih ambil gambar dari kamera atau unggah foto galeri\n\n3.Arahkan kamera pada wajah (Apabila menggunakan fitur ambil gambar dengan kamera)\n\n4..........',
                              textAlign: TextAlign.justify,
                              style: opensansTextStyle.copyWith(
                                fontSize: 17,
                                fontWeight: weightMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
          ],
        ),
      ),
    );
  }
}
