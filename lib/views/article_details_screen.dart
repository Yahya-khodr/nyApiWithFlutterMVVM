import 'package:flutter/material.dart';
import 'package:ny_testing/widgets/app_title.dart';
import 'package:ny_testing/utils/app_colors.dart';
import 'package:ny_testing/view_models/articles_view_model.dart';
import 'package:provider/provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticlesViewModel articlesViewModel = context.watch<ArticlesViewModel>();
    final imageUrl =
        articlesViewModel.selectedArticle.media![0].mediaMetadata![2].url!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(articlesViewModel.selectedArticle.section!),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppTitle(
              text: articlesViewModel.selectedArticle.title!,
              size: 24,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Hero(
                tag: imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            AppTitle(
              text: articlesViewModel.selectedArticle.abstract!,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTitle(
                  text:
                      'Published @ ${articlesViewModel.selectedArticle.publishedDate!}',
                  size: 10,
                ),
                AppTitle(
                  text: articlesViewModel.selectedArticle.byline!,
                  size: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
