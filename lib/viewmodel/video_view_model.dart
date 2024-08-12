import 'package:youtube_clone/model/video.dart';
import 'package:youtube_clone/repository/video_repository.dart';

class VideoViewModel {
  final VideoRepository repository = VideoRepository();
  final List<Video> _videos = [];

  Future<List<Video>> get_10_videos({required int max_request}) async {
    var videolist = await repository.get_videos(max_quest: 10);
    _videos.addAll(videolist);

    return Future.delayed(
      const Duration(seconds: 2),
      () => _videos,
    );
  }
}
