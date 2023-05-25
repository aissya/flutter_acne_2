import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_acne/provider/article_page_provider.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
//import 'package:skined/ui/pages/detail_article_page.dart';
//import 'package:skined/ui/widgets/article_tile_widget.dart';
//import 'package:vs_scrollbar/vs_scrollbar.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Icon(
        Icons.camera,
        size: 50,
      )),
    );
  }
}
