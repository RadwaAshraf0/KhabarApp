import 'package:dio/dio.dart';
import 'package:news_app/models/articals_model.dart';

class SearchService {
  final Dio dio;
  SearchService(this.dio);

  Future<List<ArticlesModel>> searchNews(String query) async {
    try {
      final searchParam = query.isNotEmpty ? "&search=$query" : "";

      final url =
          "https://api.thenewsapi.com/v1/news/all?api_token=YuZWn7lbbI87klKxxIN6GCNci9cEi5ObubrDXI7i&language=en$searchParam";

      final Response response = await dio.get(url);
      final Map<String, dynamic> jsonData = response.data;

      final List<dynamic> articles = jsonData['data'];
      return articles.map((artical) {
        return ArticlesModel.fromJson(artical);
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
