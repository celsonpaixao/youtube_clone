import 'dart:async';
import 'package:youtube_clone/data/events/video_events.dart';
import 'package:youtube_clone/data/state/video_states.dart';
import 'package:youtube_clone/model/video.dart';
import 'package:youtube_clone/viewmodel/video_view_model.dart';

class VideoBloc {
  final VideoViewModel _viewModel = VideoViewModel();

  final StreamController<VideoEvents> _inputVideoController =
      StreamController<VideoEvents>();

  final StreamController<VideoState> _outputVideoController =
      StreamController<VideoState>();

  Sink<VideoEvents> get inputVideo => _inputVideoController.sink;
  Stream<VideoState> get outputVideo => _outputVideoController.stream;

  VideoBloc() {
    _inputVideoController.stream.listen(_mapEventState);
  }

  void _mapEventState(VideoEvents event) async {
    _outputVideoController.add(VideoLoadingState());

    if (event is Get10Videos) {
      List<Video> videos = await _viewModel.get_10_videos(max_request: 10);
      _outputVideoController.add(VideoLoadedState(videos: videos));
    }

   
  }

  // Feche os controladores quando não forem mais necessários
  void dispose() {
    _inputVideoController.close();
    _outputVideoController.close();
  }
}
