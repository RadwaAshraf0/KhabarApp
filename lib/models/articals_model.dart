class ArticlesModel {
  final String title;
  final String? description;
  final String? image;
  final String? url;


  ArticlesModel( {
    required this.title,
    required this.description,
    required this.image,
    this.url,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      title: json['title'] as String,
      description: json['description'] as String?,
      image: json['image_url'] as String?,
      url: json['url'] as String?,
    );
  }

}