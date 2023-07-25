import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/ui/pages/scan_process_3.dart';
import 'package:tflite/tflite.dart';

class ScanProcess2 extends StatefulWidget {
  const ScanProcess2({Key? key, required this.image}) : super(key: key);
  final File? image;

  @override
  State<ScanProcess2> createState() => _ScanProcess2State();
}

class _ScanProcess2State extends State<ScanProcess2> {
  @override
  void initState() {
    super.initState();
    _loadModel();
    Future.delayed(const Duration(milliseconds: 500), () {
      _imageClasification(widget.image);
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  void _loadModel() async {
    await Tflite.loadModel(
      model: "assets/92_resnet.tflite",
      labels: "assets/labels_82.txt",
    );
  }

  void _imageClasification(File? image) async {
    var output = await Tflite.runModelOnImage(
      path: image!.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      print(output![0]["label"]);
      Future.delayed(const Duration(milliseconds: 1700), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScanProcess3(
              image: widget.image,
              pred: output,
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(40)),
                child: Lottie.asset(
                  'assets/loading_skin4.json',
                  height: getProportionateScreenHeight(300),
                  width: getProportionateScreenWidth(300),
                ),
              ),
              Text(
                'Processing',
                style: aclonicaTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: pinkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
