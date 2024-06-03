import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_news_app/controllers/news_controller.dart';

import '../utils/header_widget.dart';

class NewsPage extends StatelessWidget {NewsPage({super.key});
  final NewsController newsController = Get.put(NewsController());

  final List<Color> redMist = const [
    Color(0xFF000000),
    Color(0xFFe74c3c),
  ];
  final List<Color> newsGreen = const [
    Color(0xFF52c234),
    Color(0xFF061700),
  ];

final String displayImage = "https://images.unsplash.com/photo-1525389999255-82bad487f23c?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: newsGreen,
          ),
        ),
        child: Column(
          children: [
            Header(displayImage: displayImage),
            const Divider(height: 0.5, color: Colors.white,),
            Expanded(
                child: Obx(() =>
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: newsController.news.value.articles.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        height: 100,
                        // width: 200,
                        // color: Colors.white60,
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blueGrey
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  newsController.news.value.articles[index].urlToImage ?? displayImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Expanded(
                              child: Text(
                                newsController.news.value.articles[index].title,
                                style: const TextStyle(color: Colors.white, fontSize: 13),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
