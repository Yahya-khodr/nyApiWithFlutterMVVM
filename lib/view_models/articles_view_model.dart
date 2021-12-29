import 'package:flutter/cupertino.dart';

import 'package:ny_testing/models/article_response_model.dart';
import 'package:ny_testing/models/article_result_model.dart';
import 'package:ny_testing/repo/api_status.dart';
import 'package:ny_testing/repo/article_services.dart';

class ArticlesViewModel extends ChangeNotifier {
  bool _loading = false;
  ArticleResponse _articlesListModel = ArticleResponse();
  // List<Results> _articlesListModel = [];
  Results _selectedArticle = Results();

  bool get loading => _loading;
  ArticleResponse get articlesListModel => _articlesListModel;
  Results get selectedArticle => _selectedArticle;
  ArticlesViewModel() {
    getArticles();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setArticlesListModel(ArticleResponse articlesListModel) {
    _articlesListModel = articlesListModel;
  }

  setSelectedArticle(Results article) {
    _selectedArticle = article;
  }

  getArticles() async {
    setLoading(true);
    var response = await ArticleServices.getArticles();
    if (response is Success) {
      setArticlesListModel(response.response as ArticleResponse);
    }
    if (response is Failture) {
      //
    }
    setLoading(false);
  }
}
