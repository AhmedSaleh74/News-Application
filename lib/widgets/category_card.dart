import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile_list_view.dart';
import '../models/atricle_model.dart';
import '../services/new_service.dart';
class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.img, required this.catName});
  final String img;
  final String catName;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  Future<void> getNews() async {
    final fetchedArticles = await NewService(dio: Dio(), category:widget.catName,).getNews();
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
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Scaffold(
            appBar: AppBar(title: Text(widget.catName),),
            body: CustomScrollView(
              slivers: [
                NewsTileListView(category: widget.catName.toLowerCase()),
              ],
            ),
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.0),
        width: 250,
        height: 135,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.img),fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(child: Text(widget.catName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
      ),
    );
  }
}