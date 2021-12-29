
import 'package:ny_testing/models/article_media_model.dart';


class Results {
  String? source;
  String? publishedDate;
  String? updated;
  String? section;
  String? byline;
  String? type;
  String? title;
  String? abstract;
  List<Media>? media;

  Results({
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.byline,
    this.type,
    this.title,
    this.abstract,
    this.media,
  });

  Results.fromJson(Map<String, dynamic> json) {
    source = json["source"];
    publishedDate = json["published_date"];
    updated = json["updated"];
    section = json["section"];

    byline = json["byline"];
    type = json["type"];
    title = json["title"];
    abstract = json["abstract"];

    media = json["media"] == null
        ? null
        : (json["media"] as List).map((e) => Media.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["source"] = source;
    data["published_date"] = publishedDate;
    data["updated"] = updated;
    data["section"] = section;

    data["byline"] = byline;
    data["type"] = type;
    data["title"] = title;
    data["abstract"] = abstract;

    if (media != null) {
      data["media"] = media?.map((e) => e.toJson()).toList();
    }

    return data;
  }
}