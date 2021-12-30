import 'package:flutter/cupertino.dart';

import 'package:ny_testing/models/article_response_model.dart';
import 'package:ny_testing/models/article_result_model.dart';
import 'package:http/http.dart'as http;
import 'package:ny_testing/services/api_status.dart';
import 'package:ny_testing/services/api_services.dart';

class ArticlesViewModel extends ChangeNotifier {
  bool _loading = false;
  ArticleResponse _articlesList = ArticleResponse();
  // List<Results> _articlesListModel = [];
  Results _selectedArticle = Results();
  final ApiServices _articleServices = ApiServices();
  bool get loading => _loading;
  ArticleResponse get articlesListModel => _articlesList;
  Results get selectedArticle => _selectedArticle;
  ArticlesViewModel() {
    getArticles();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setArticlesListModel(ArticleResponse articlesListModel) {
    _articlesList = articlesListModel;
  }

  setSelectedArticle(Results article) {
    _selectedArticle = article;
  }

  getArticles() async {
    setLoading(true);
    var response = await _articleServices.getArticles(http.Client());
    if (response is Success) {
      setArticlesListModel(response.response as ArticleResponse);
    }
    if (response is Failure) {
      //
    }
    setLoading(false);
  }
}
