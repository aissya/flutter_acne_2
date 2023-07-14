import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ScanProcess3Detail extends StatefulWidget {
  const ScanProcess3Detail(
      {Key? key,
      this.image,
      required this.sDetail,
      required this.lDetail,
      required this.penyakit,
      required this.perawatan,
      required this.penyebab})
      : super(key: key);
  final File? image;
  final String sDetail;
  final String lDetail;
  final String penyakit;
  final String perawatan;
  final String penyebab;

  @override
  _ScanProcess3DetailState createState() => _ScanProcess3DetailState();
}

class _ScanProcess3DetailState extends State<ScanProcess3Detail> {
  bool lText = false;

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

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
              vertical: getProportionateScreenHeight(22),
              horizontal: getProportionateScreenWidth(29)),
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
                height: getProportionateScreenHeight(10),
              ),
              lText
                  ? GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          lText = false;
                        });
                      },
                      child: Text(
                        widget.lDetail,
                        style: opensansTextStyle.copyWith(
                          fontSize: getProportionateScreenWidth(13),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          lText = !lText;
                        });
                      },
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.sDetail + ' ',
                              style: opensansTextStyle.copyWith(
                                fontSize: getProportionateScreenWidth(12.5),
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: '..more',
                              style: opensansTextStyle.copyWith(
                                  fontSize: getProportionateScreenWidth(12.5),
                                  color: blue2Color),
                            ),
                          ],
                        ),
                      ),
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
            ],
          ),
        ),
      ],
    );
  }
}
