import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/news_tile_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final images = const [
    CategoryModel(image:'assets/general_1.jpeg', catName:'General'),
    CategoryModel(image:'assets/entertaiment.jpeg', catName:'Entertainment'),
    CategoryModel(image:'assets/business.jpeg', catName:'Business'),
    CategoryModel(image:'assets/health_1.jpeg', catName:'Health'),
    CategoryModel(image:'assets/science.jpeg', catName:'Science'),
    CategoryModel(image:'assets/sports.jpeg', catName:'Sports'),
    CategoryModel(image:'assets/technology.jpeg', catName:'Technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Hub',
              style: TextStyle(
                  color: Colors.orangeAccent, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child:CategoriesListView(images: images),),
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          NewsTileListView(),
        ],
      )
    );
  }
}