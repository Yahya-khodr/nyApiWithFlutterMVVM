
import 'package:flutter/material.dart';
import 'package:ny_testing/views/article_details_screen.dart';

void openArticleDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ArticleDetailScreen(),
    ),
  );
}
