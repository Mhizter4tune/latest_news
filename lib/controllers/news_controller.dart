import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latest_news_app/utils/api_services.dart';
import 'package:latest_news_app/models/news_model.dart';

class NewsController extends GetxController {
  Rx<News> news = News(articles: []).obs;
  // var news = News(articles: []).obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    debugPrint('Fetching News');
    var newsResult = await APIServices().fetchNews();
    // if (newsResult != null)
    debugPrint(newsResult.toString());
    news.value = newsResult;
  }
}

