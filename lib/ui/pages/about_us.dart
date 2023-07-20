import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/ui/widgets/profile_info_widget.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class AboutUsScreenPage extends StatefulWidget {
  const AboutUsScreenPage({Key? key}) : super(key: key);

  @override
  _AboutUsScreenPageState createState() => _AboutUsScreenPageState();
}

class _AboutUsScreenPageState extends State<AboutUsScreenPage> {
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
          padding: EdgeInsets.only(top: getProportionateScreenHeight(40)),
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
                'About Us',
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
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(50)),
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //girl asset dan title
                  Text(
                    'Mooi Skin',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 40,
                      fontWeight: weightBold,
                      color: greenColor,
                    ),
                  ),
                  Image.asset(
                    'assets/girl_logo.png',
                    width: getProportionateScreenWidth(250),
                  ),
                  Text(
                    '"Beauty is the art of being yourself." ',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: weightMedium,
                    ),
                  ),
                  Text(
                    '- Audrey Hepburn ',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: weightMedium,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(40),
                left: getProportionateScreenWidth(25),
                right: getProportionateScreenWidth(25),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mooi Skin app is here to help you understand and solve acne problems easily and effectively.',
                        textAlign: TextAlign.justify,
                        style: opensansTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: weightMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(80)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //girl asset dan title
                  Text(
                    'Team',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: weightBold,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: getProportionateScreenHeight(30),
                right: getProportionateScreenHeight(30),
                bottom: getProportionateScreenHeight(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileInfoWidget(
                        image: 'assets/icon_home.png',
                        name: 'Aissya Embun.S. ',
                        info: 'IK3A | 3.34.20.0.03',
                      ),
                      ProfileInfoWidget(
                        image: 'assets/icon_home.png',
                        name: 'Siti Nurhaliza',
                        info: 'IK3A | 3.34.20.0.22',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(80)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //girl asset dan title
                  Text(
                    'Advisor',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: weightBold,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: getProportionateScreenHeight(30),
                right: getProportionateScreenHeight(30),
                bottom: getProportionateScreenHeight(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileInfoWidget(
                        image: 'assets/icon_home.png',
                        name: 'Slamet Handoko,\n S. Kom., M. Kom.\n',
                        info: 'NIP. 197501302001121001',
                      ),
                      ProfileInfoWidget(
                        image: 'assets/icon_home.png',
                        name: 'Prayitno, S.ST.,\n M.T., Ph.D.\n',
                        info: 'NIP. 198504102014041002',
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
