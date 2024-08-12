class Video {
  final String id;
  final String title;
  final String channelTitle;
  final DateTime publish_date;
  final String thumbnail;
  final String duration;
  final String views_value;

  Video({
    required this.id,
    required this.title,
    required this.publish_date,
    required this.thumbnail,
    required this.duration,
    required this.channelTitle,
    required this.views_value,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"],
      title: json["snippet" "title"],
      channelTitle: json["snippet" "channelTitle"],
      publish_date: json["snippet" "publishedAt"],
      thumbnail: json["thumbnails" "default" "url"],
      duration: json["contentDetails" "duration"],
      views_value: json["statistics" "viewCount"],
    );
  }
}
