import 'package:ny_testing/models/article_result_model.dart';

class ArticleResponse {
  String? status;
  String? copyright;
  int? numResults;
  List<Results>? results;

  ArticleResponse({this.status, this.copyright, this.numResults, this.results});

  ArticleResponse.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    copyright = json["copyright"];
    numResults = json["num_results"];
    results = json["results"] == null
        ? null
        : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["copyright"] = copyright;
    data["num_results"] = numResults;
    if (results != null) {
      data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

