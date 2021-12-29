
class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetadata>? mediaMetadata;

  Media(
      {this.type,
      this.subtype,
      this.caption,
      this.copyright,
      this.approvedForSyndication,
      this.mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    subtype = json["subtype"];
    caption = json["caption"];
    copyright = json["copyright"];
    approvedForSyndication = json["approved_for_syndication"];
    mediaMetadata = json["media-metadata"] == null
        ? null
        : (json["media-metadata"] as List)
            .map((e) => MediaMetadata.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    data["subtype"] = subtype;
    data["caption"] = caption;
    data["copyright"] = copyright;
    data["approved_for_syndication"] = approvedForSyndication;
    if (mediaMetadata != null) {
      data["media-metadata"] = mediaMetadata?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class MediaMetadata {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetadata({this.url, this.format, this.height, this.width});

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json["url"];
    format = json["format"];
    height = json["height"];
    width = json["width"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["format"] = format;
    data["height"] = height;
    data["width"] = width;
    return data;
  }
}
