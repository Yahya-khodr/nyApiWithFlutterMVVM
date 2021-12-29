import 'package:flutter/material.dart';
import 'package:ny_testing/components/app_icon.dart';
import 'package:ny_testing/components/app_title.dart';
import 'package:ny_testing/models/article_result_model.dart';
import 'package:ny_testing/utils/app_colors.dart';
import 'package:ny_testing/utils/navigation_utils.dart';
import 'package:ny_testing/view_models/articles_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArticlesViewModel articlesViewModel = context.watch<ArticlesViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppColors.appBarColor,
        title: const AppTitle(
          text: "NY Times Most Popular",
          size: 18,
        ),
        leading: AppIcon(
          icon: Icons.menu,
          onPressed: () {},
        ),
        actions: <Widget>[
          AppIcon(
            icon: Icons.search,
            onPressed: () {},
          ),
          AppIcon(
            icon: Icons.more_vert,
            onPressed: () {},
          )
        ],
      ),
      body: articlesViewModel.articlesListModel.status == 'OK'
          ? ListView.builder(
              itemCount: articlesViewModel.articlesListModel.results!.length,
              itemBuilder: (con, index) {
                Results article =
                    articlesViewModel.articlesListModel.results![index];
                return Card(
                  child: ListTile(
                    onTap: () async {
                      articlesViewModel.setSelectedArticle(article);
                      openArticleDetails(context);
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          article.media![0].mediaMetadata![2].url!),
                    ),
                    // leading: Image.network(articlesViewModel.articlesListModel
                    //     .results![index].media![0].mediaMetadata![2].url!),
                    title: Text(
                      article.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    horizontalTitleGap: 10,

                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AppTitle(
                            text: article.byline!,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.date_range,
                                color: AppColors.iconColor,
                              ),
                              AppTitle(
                                text: article.publishedDate!,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    trailing: AppIcon(
                      icon: Icons.arrow_forward_ios,
                      iconSize: 18,
                      onPressed: () {},
                    ),
                  ),
                );
              })
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
