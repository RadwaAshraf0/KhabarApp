import 'package:flutter/material.dart';
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/pages/content.dart';

class NewTile extends StatefulWidget {
  const NewTile({super.key, required this.articlesModel});
  final ArticlesModel articlesModel;

  @override
  State<NewTile> createState() => _NewTileState();
}

class _NewTileState extends State<NewTile> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ContentPage(articleUrl: widget.articlesModel.url!),
            ),
          );
        },
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      widget.articlesModel.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/news_image.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 250,
                        );
                      },
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.articlesModel.title ?? "",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xfff50b09),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.articlesModel.description ?? "",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 123, 123, 123),
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
