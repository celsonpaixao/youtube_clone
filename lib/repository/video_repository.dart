import 'dart:convert';
import 'package:youtube_clone/model/video.dart';
import 'package:youtube_clone/resources/app_constats.dart';
import 'package:http/http.dart' as http;

abstract class IVideoRepository {
  Future<List<Video>> getVideos({required int maxQuest});
}

class VideoRepository implements IVideoRepository {
  @override
  Future<List<Video>> getVideos({required int maxQuest}) async {
    var url = Uri.parse(
      "${baseUrl}v3/videos?part=snippet,contentDetails,statistics&chart=mostPopular&regionCode=$regionCode&maxResults=$maxQuest&key=$apiKey",
    );
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey("items")) {
          List<dynamic> body = data["items"];
          return body.map((e) => Video.fromJson(e)).toList();
        } else {
          throw Exception("No video items found in the response.");
        }
      } else {
        throw Exception(
            "Failed to load videos. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }
}
