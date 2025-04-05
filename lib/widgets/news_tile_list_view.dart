import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/atricle_model.dart';
import '../services/new_service.dart';
import 'indicator.dart';
import 'news_tile.dart';

class NewsTileListView extends StatefulWidget {
  const NewsTileListView({
    super.key,required this.category,
  });
  final String category;
  @override
  State<NewsTileListView> createState() => _NewsTileListViewState();
}

class _NewsTileListViewState extends State<NewsTileListView> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  @override
  void initState(){
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    final fetchedArticles = await NewService(dio: Dio(), category:widget.category,).getNews();
    if (fetchedArticles != null) {
      articles = fetchedArticles;
      isLoading = false;
      setState(() {});
    } else {
      articles = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading? NewsIndicatorLoading() : SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: articles.length,
                (context, index) {
      return NewsTile(articleModel: articles[index],);
    }));
  }
}
