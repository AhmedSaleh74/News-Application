import 'package:dio/dio.dart';
import 'package:news_app/models/atricle_model.dart';

class NewService {
  final Dio dio;
  final String category;
  const NewService({required this.dio,required this.category,});

  Future<List<ArticleModel>?> getNews() async {
    try {
      final response = await dio.get(
        'https://newsapi.org/v2/everything?q=$category&apiKey=64cc2b11fb6f4fc8b221957a6217151c&language=en',
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;

        if (jsonData.containsKey('articles')) {
          final articles = jsonData['articles'] as List;

          List<ArticleModel> articleList = [];

          for (var article in articles) {
            articleList.add(
              ArticleModel(
                image: article['urlToImage'] ?? '',
                title: article['title'] ?? 'No Title',
                subTitle: article['description'] ?? 'No Description',
              ),
            );
          }

          print('✅ Successfully fetched ${articleList.length} articles.');
          return articleList;
        }
      }
    } catch (e) {
      print('❌ Error fetching news: $e');
    }

    return [];
  }
}
