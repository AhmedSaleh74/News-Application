import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.img, required this.catName});
  final String img;
  final String catName;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: 8.0,right: 8.0),
      width: 250,
      height: 135,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(img),fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(child: Text(catName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),)),
    );
  }
}
