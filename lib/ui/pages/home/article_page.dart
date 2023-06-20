import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_acne/provider/article_page_provider.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:flutter_acne/ui/pages/detail_article_page.dart';
import 'package:flutter_acne/ui/widgets/article_tile_widget.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    ArticlePageProvider articlePageProvider =
        Provider.of<ArticlePageProvider>(context);
    Widget listArticle() {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: whiteColor,
          automaticallyImplyLeading: false,
          toolbarHeight: getProportionateScreenHeight(60),
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: pinkColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Artikel',
                style: opensansTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
        body: VsScrollbar(
          controller: _scrollController,
          showTrackOnHover: true, // default false
          isAlwaysShown: true,
          style: VsScrollbarStyle(
            color: Color(0xff9D9F9F),
            hoverThickness: 100.0,
            radius: Radius.circular(5),
            thickness: 7,
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                const ArticleTileWidget(
                  id: 0,
                  image: 'assets/icon_home.png',
                  title: 'blackhead',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                const ArticleTileWidget(
                  id: 1,
                  image: 'assets/icon_home.png',
                  title: 'nodules',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                const ArticleTileWidget(
                  id: 2,
                  image: 'assets/icon_home.png',
                  title: 'normalface',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                const ArticleTileWidget(
                  id: 3,
                  image: 'assets/icon_home.png',
                  title: 'papula',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                const ArticleTileWidget(
                  id: 4,
                  image: 'assets/icon_home.png',
                  title: 'pustula',
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                )
              ],
            ),
          ),
        ),
      );
    }

    switch (articlePageProvider.currentIndex) {
      case 0:
        return const DetailArticle(
          title: 'blackhead',
          image: 'assets/icon_home.png',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        );
      case 1:
        return const DetailArticle(
          title: 'nodules',
          image: 'assets/icon_home.png',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        );
      case 2:
        return const DetailArticle(
          title: 'normalface',
          image: 'assets/icon_home.png',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        );
      case 3:
        return const DetailArticle(
          title: 'papula',
          image: 'assets/icon_home.png',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        );
      case 4:
        return const DetailArticle(
          title: 'pustula',
          image: 'assets/icon_home.png',
          subTitle:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        );
      case 5:
        return listArticle();
      default:
        return listArticle();
    }
  }
}
