import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ScanProcess3Detail extends StatefulWidget {
  const ScanProcess3Detail({
    Key? key,
    this.image,
    required this.pengertian,
    required this.penyakit,
    required this.perawatan,
    required this.penyebab,
    required this.disclaimer,
    required this.pengertianinggris,
    required this.perawataninggris,
    required this.penyebabinggris,
    required this.disclaimeringgris,
  }) : super(key: key);
  final File? image;
  final String pengertian;
  final String penyakit;
  final String perawatan;
  final String penyebab;
  final String disclaimer;
  final String pengertianinggris;
  final String perawataninggris;
  final String penyebabinggris;
  final String disclaimeringgris;

  @override
  _ScanProcess3DetailState createState() => _ScanProcess3DetailState();
}

class _ScanProcess3DetailState extends State<ScanProcess3Detail> {
  bool bahasa = true;
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    Widget indonesiaWidget() {
      return Container(
        child: VsScrollbar(
          controller: _scrollController,
          showTrackOnHover: true, // default false
          isAlwaysShown: true,

          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.penyakit.toUpperCase(),
                      style: opensansTextStyle.copyWith(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: weightBold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Text(
                      widget.pengertian,
                      style: opensansTextStyle.copyWith(
                        fontSize: getProportionateScreenWidth(13),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PENYEBAB',
                          style: opensansTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: weightBold,
                          ),
                        ),
                        Text(
                          widget.penyebab,
                          style: opensansTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(13),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PERAWATAN',
                          style: opensansTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: weightBold,
                          ),
                        ),
                        Text(
                          widget.perawatan,
                          style: opensansTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(13),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    Container(
                      padding:
                          EdgeInsets.all(8), // Atur padding sesuai kebutuhan
                      decoration: BoxDecoration(
                        color: yellowColor, // Atur warna background box
                        borderRadius:
                            BorderRadius.circular(5), // Atur radius border box
                      ),
                      width: getProportionateScreenWidth(400),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Disclaimer',
                            style: opensansTextStyle.copyWith(
                              fontSize: getProportionateScreenWidth(15),
                              fontWeight: weightBold,
                            ),
                          ),
                          Text(
                            widget.disclaimer,
                            style: opensansTextStyle.copyWith(
                              fontSize: getProportionateScreenWidth(13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget inggrisWidget() {
      return Container(
        child: VsScrollbar(
          controller: _scrollController,
          showTrackOnHover: true, // default false
          isAlwaysShown: true,

          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10),
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.penyakit.toUpperCase(),
                      style: opensansTextStyle.copyWith(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: weightBold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Text(
                      widget.pengertianinggris,
                      style: opensansTextStyle.copyWith(
                        fontSize: getProportionateScreenWidth(13),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CAUSES',
                          style: opensansTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: weightBold,
                          ),
                        ),
                        Text(
                          widget.penyebabinggris,
                          style: opensansTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(13),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TREATMENT',
                          style: opensansTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(20),
                            fontWeight: weightBold,
                          ),
                        ),
                        Text(
                          widget.perawataninggris,
                          style: opensansTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(13),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(50),
                    ),
                    Container(
                      padding:
                          EdgeInsets.all(8), // Atur padding sesuai kebutuhan
                      decoration: BoxDecoration(
                        color: yellowColor, // Atur warna background box
                        borderRadius:
                            BorderRadius.circular(5), // Atur radius border box
                      ),
                      width: getProportionateScreenWidth(400),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Disclaimer',
                            style: opensansTextStyle.copyWith(
                              fontSize: getProportionateScreenWidth(15),
                              fontWeight: weightBold,
                            ),
                          ),
                          Text(
                            widget.disclaimeringgris,
                            style: opensansTextStyle.copyWith(
                              fontSize: getProportionateScreenWidth(13),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          width: double.infinity,
          height: getProportionateScreenHeight(620),
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(10),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border color
            image: DecorationImage(
              // image from image Xfile
              image: Image.file(widget.image!).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
              horizontal: getProportionateScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // make double button
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bahasa = true;
                      });
                    },
                    child: Container(
                      width: getProportionateScreenWidth(50),
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: getProportionateScreenWidth(0.5),
                        ),
                        color: bahasa ? yellowColor : whiteColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/inggris.png',
                          width: getProportionateScreenWidth(30),
                          height: getProportionateScreenHeight(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bahasa = false;
                      });
                    },
                    child: Container(
                      width: getProportionateScreenWidth(50),
                      height: getProportionateScreenHeight(50),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: getProportionateScreenWidth(0.5),
                        ),
                        color: bahasa ? whiteColor : yellowColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/indonesia.png',
                          width: getProportionateScreenWidth(30),
                          height: getProportionateScreenHeight(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bahasa ? inggrisWidget() : indonesiaWidget(),
      ],
    );
  }
}
