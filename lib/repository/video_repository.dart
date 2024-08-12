import 'dart:convert';

import 'package:youtube_clone/model/video.dart';
import 'package:youtube_clone/resources/app_constats.dart';
import 'package:http/http.dart' as http;

abstract class IVideoRepository {
  Future<List<Video>> get_videos({required int max_quest});
}

class VideoRepository implements IVideoRepository {
  @override
  Future<List<Video>> get_videos({required int max_quest}) async {
    var url = Uri.parse(
      "${baseUrl}v3/videos?part=snippet,contentDetails,statistics&chart=mostPopular&regionCode=$regionCode&maxResults=$max_quest&key=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)["items"];
      return body.map((e) => Video.fromJson(e)).toList();
    } else {
      throw Exception("Video not found!!");
    }
  }
}
