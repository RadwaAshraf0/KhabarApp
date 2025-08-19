import 'package:dio/dio.dart';
import 'package:news_app/models/articals_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticlesModel>> getNews(
    String? selectedFlag,
    String? category,
  ) async {
    try {
      final localeParam = (selectedFlag != null && selectedFlag.isNotEmpty)
          ? "&locale=$selectedFlag"
          : "";
      final categoryParam = (category != null && category.isNotEmpty)
          ? "&categories=$category"
          : "&categories=general";

      final url =
          "https://api.thenewsapi.com/v1/news/top?api_token=YuZWn7lbbI87klKxxIN6GCNci9cEi5ObubrDXI7i&language=en&$localeParam$categoryParam";

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
