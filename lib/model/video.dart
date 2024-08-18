class Video {
  final String id;
  final String title;
  final String channelTitle;
  final DateTime publishDate;
  final String thumbnail;
  String channelThumbnail;
  final String duration;
  final String viewsValue;

  Video({
    required this.id,
    required this.title,
    required this.publishDate,
    required this.thumbnail,
    required this.duration,
    required this.channelTitle,
    required this.viewsValue,
    required this.channelThumbnail,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json["id"],
        title: json["snippet"]["title"],
        channelTitle: json["snippet"]["channelTitle"],
        publishDate: DateTime.parse(json["snippet"]["publishedAt"]),
        thumbnail: json["snippet"]["thumbnails"]["maxres"]["url"],
        duration: json["contentDetails"]["duration"],
        viewsValue: json["statistics"]["viewCount"],
        channelThumbnail: "");
  }
}
