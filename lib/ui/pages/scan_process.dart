import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/ui/pages/scan_process_2.dart';

// ignore: must_be_immutable
class ScanProcess extends StatefulWidget {
  ScanProcess({
    Key? key,
    required this.image,
    required this.state,
  }) : super(key: key);
  // add file image
  File? image;
  final int state;

  @override
  State<ScanProcess> createState() => _ScanProcessState();
}

class _ScanProcessState extends State<ScanProcess> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: whiteColor,
          toolbarHeight: getProportionateScreenHeight(60),
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(40)),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: pinkColor,
            ),
            child: Center(
              child: Text(
                'Scan',
                style: aclonicaTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(620),
                width: double.infinity,
                child: Image.file(
                  widget.image!,
                  fit: BoxFit.cover,
                ),
              ),
              // elevated button

              SizedBox(
                height: getProportionateScreenHeight(24),
              ),

              Container(
                margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(50),
                      margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          primary: yellowColor,
                        ),
                        onPressed: () {
                          // file picker gallery
                          ImagePicker()
                              .pickImage(
                                  source: widget.state == 1
                                      ? ImageSource.gallery
                                      : ImageSource.camera)
                              .then((value) {
                            if (value != null) {
                              // override image
                              setState(() {
                                widget.image = File(value.path);
                              });
                            }
                          });
                        },
                        child: Icon(Icons.change_circle),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(220),
                      height: getProportionateScreenHeight(50),
                      margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          primary: pinkColor,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScanProcess2(
                                image: widget.image,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Process',
                          style: aclonicaTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: weightSemiBold,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
