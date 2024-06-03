import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:latest_news_app/models/news_model.dart';

class APIServices {
// GET API REQUEST
  Future<News> fetchNews() async {
    final uri = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8fc1e942ab6f41c19be877b848b23875");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      debugPrint(jsonString.length.toString());
      // return News.fromJson(json.decode(response.body));  This line(or method) needs the dart:convert library
      return newsFromJson(jsonString);
    } else {
      throw Exception('Failed to load post');
    }
  }

// POST API REQUEST
  Future<News> createNews(String title, String body) async {
    Map<String, dynamic> request = {
      'title': title,
      'body': body,
      'userId': "111"
    };
    final uri = Uri.parse("https://jsonplaceholder.typeicode.com/posts/1");
    final response = await http.post(uri, body: request);

    if (response.statusCode == 201) {
      return newsFromJson(response.body);
    } else {
      throw Exception('Failed to create post');
    }
  }

// UPDATE API REQUEST
  Future<News> updateNews(String title, String body) async {
    Map<String, dynamic> request = {
      'id': "101",
      'title': title,
      'body': body,
      'userId': "111",
    };
    final uri = Uri.parse("https://jsonplaceholder.typeicode.com/posts/1");
    final response = await http.put(uri, body: request);

    if (response.statusCode == 200) {
      return newsFromJson(response.body);
    } else {
      throw Exception('Failed to update post');
    }
  }

// DELETE API REQUEST
  Future<News?>? deleteNews() async {
    final uri = Uri.parse("https://jsonplaceholder.typeicode.com/posts/1");
    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      return null;
    } else {
      throw Exception('Failed to delete post');
    }
  }
}