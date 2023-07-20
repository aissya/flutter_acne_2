import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_acne/ui/pages/home/detail_artikel_api.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_acne/provider/article_page_provider.dart';
import 'package:flutter_acne/shared/theme.dart';
import 'package:flutter_acne/shared/size_config.dart';
import 'package:http/http.dart' as http;
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
      'https://gnews.io/api/v4/search?q=skin&apikey=9bafcb2a381f4ac20c0c2f4e68be89ab';
  //'https://api.mediastack.com/v1/news?access_key=36811f3c472803e4e5c8664db151a592&country=id';
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Artikel')),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: whiteColor,
              height: 100,
              width: 100,
              child: _posts[index]['urlToImage'] != null
                  ? Image.network(
                      _posts[index]['urlToImage'],
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (contex) => DetailArtikel(
                            url: _posts[index]['url'],
                            title: _posts[index]['title'],
                            author: _posts[index]['author'],
                            publishedAt: _posts[index]['publishedAt'],
                          )));
            },
          );
        },
      ),
    );
  }

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
