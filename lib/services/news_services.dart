import 'package:dio/dio.dart';
import 'package:news_app/models/articals_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticlesModel>> getNews(
    String? selectedFlag,
    String? category,
    String? searchQuery,
  ) async {
    try {
      final localeParam = (selectedFlag != null && selectedFlag.isNotEmpty)
          ? "&locale=$selectedFlag"
          : "";

      final categoryParam = (category != null && category.isNotEmpty)
          ? "&categories=$category"
          : "&categories=general";

      final searchParam = (searchQuery != null && searchQuery.isNotEmpty)
          ? "&search=$searchQuery"
          : "";

      final url =
          "https://api.thenewsapi.com/v1/news/all?api_token=ifuMCDc88I8L9bzpCN9MVoGbvR6RpjatTUtJo7e6&language=en$localeParam$categoryParam$searchParam";

      Response response = await dio.get(url);
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['data'];
      return articles.map((artical) {
        return ArticlesModel.fromJson(artical);
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
