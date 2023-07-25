import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_acne/ui/pages/home/detail_artikel_api.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_acne/provider/article_page_provider.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
//import 'package:skined/ui/pages/detail_article_page.dart';
//import 'package:skined/ui/widgets/article_tile_widget.dart';
//import 'package:vs_scrollbar/vs_scrollbar.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final _baseUrl =
      //'https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=0ddeab976e0e4441a2673230581825e9';
      'https://gnews.io/api/v4/search?q=acne&lang=en&apikey=9bafcb2a381f4ac20c0c2f4e68be89ab';
  //'https://newsapi.org/v2/top-headlines?q=skin&apiKey=0ddeab976e0e4441a2673230581825e9';
  //'https://api.mediastack.com/v1/news?access_key=36811f3c472803e4e5c8664db151a592&country=id';
  //'http://api.mediastack.com/v1/news?access_key=36811f3c472803e4e5c8664db151a592&keywords=virus';

  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Article')),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Article',
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
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: whiteColor,
              height: 100,
              width: 100,
              child: _posts[index]['image'] != null
                  ? Image.network(
                      _posts[index]['image'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Center(),
            ),
            title: Text(
              '${_posts[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_posts[index]['description']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () async {
              final Uri web = Uri.parse('${_posts[index]['url']}');
              launchUrl(web);

              // Uri uri = Uri.https(
              //   '${_posts[index]['url']}',
              // );

              // GestureDetector(
              //   onTap: () async {
              //     final Uri web = Uri.parse('${_posts[index]['url']}');
              //     launchUrl(web);
              //   },
              //   child: const Text("Launch URL"),
              // );

              // final url = Uri.parse('${_posts[index]['url']}');
              // _openNewsUrl(url);

              // _openNewsUrl(_posts[index]['url']);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (contex) => DetailArtikel(
              //               url: _posts[index]['url'],
              //               title: _posts[index]['title'],
              //               image: _posts[index]['image'],
              //               content: _posts[index]['content'],
              //               author: _posts[index]['author'],
              //               publishedAt: _posts[index]['publishedAt'],
              //             )));
            },
          );
        },
      ),
    );
  }

  // Future<void> _openNewsUrl(Uri url) async {
  //   //await launchUrlString(url);
  //   //final url = Uri.parse($url)
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
        print(_posts);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
