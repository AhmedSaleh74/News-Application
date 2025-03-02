import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.images,
  });

  final List<CategoryModel> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 135,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return CategoryCard(img:images[index].image,catName: images[index].catName,);
          }),
    );
  }
}
