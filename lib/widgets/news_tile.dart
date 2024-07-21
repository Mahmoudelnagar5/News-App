import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mahmoud/models/article_model.dart';
import 'package:mahmoud/views/article_web_view.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleWebView(
              url: articleModel.url,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              // spreadRadius: 5,
              // blurRadius: 7,
              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
          border: Border.all(color: Color.fromARGB(255, 197, 0, 115)),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade900,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: articleModel.image != null
                    ? CachedNetworkImage(
                        imageUrl: articleModel.image!,
                        height: 140,
                        fit: BoxFit.cover,
                        errorWidget: (context, error, stackTrace) {
                          return Image.network(
                            "https://th.bing.com/th/id/OIP.fzGej741m6MnT_5KrHWrBAHaFj?w=919&h=689&rs=1&pid=ImgDetMain",
                            height: 120,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.network(
                        "https://th.bing.com/th/id/OIP.fzGej741m6MnT_5KrHWrBAHaFj?w=919&h=689&rs=1&pid=ImgDetMain",
                        height: 120,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    articleModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    articleModel.subtitle ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
