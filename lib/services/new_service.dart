import 'package:dio/dio.dart';
import 'package:news_app/models/atricle_model.dart';

class NewService{
  final Dio dio;
  const NewService(this.dio);
  getNews()async{
    final response = await dio.get(
        'https://newsapi.org/v2/everything?q=general&apiKey=64cc2b11fb6f4fc8b221957a6217151c&language=ar',
    );
    Map<String,dynamic> jsonData = response.data;
    final articles = jsonData['articles'];
    var articleList;
    for(var article in articles){
      if(articles != null){
        articleList.add(ArticleModel(image: article['urlToImage'], title:article['title'], subTitle: article['description'],source: Source(id: article['source']['id'], name: article['source']['name'])));
      }
    }
  }
}