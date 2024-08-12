import 'package:youtube_clone/model/video.dart';

abstract class VideoState {
  final List<Video> videos;

  VideoState({required this.videos});
}

class VideoInitialState extends VideoState {
  VideoInitialState() : super(videos: []);
}

class VideoLoadingState extends VideoState {
  VideoLoadingState() : super(videos: []);
}

class VideoLoadedState extends VideoState {
  VideoLoadedState({required List<Video> videos}) : super(videos: videos);
}

class VideoErrorState extends VideoState {
  final Exception exception;

  VideoErrorState({required this.exception}) : super(videos: []);
}
