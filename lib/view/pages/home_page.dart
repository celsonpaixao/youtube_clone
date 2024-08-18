import 'package:flutter/material.dart';
import 'package:youtube_clone/data/blocs/video_bloc.dart';
import 'package:youtube_clone/data/events/video_events.dart';
import 'package:youtube_clone/data/state/video_states.dart';
import 'package:youtube_clone/view/components/card_video.dart';
import 'package:youtube_clone/view/components/global_appbar.dart';
import 'package:youtube_clone/view/components/global_icon_button.dart';
import 'package:youtube_clone/view/components/global_shimmer.dart';
import 'package:youtube_clone/view/components/global_user_avatar.dart';
import 'package:youtube_clone/view/components/layout_page.dart';
import 'package:youtube_clone/view/components/view_tab_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final VideoBloc _videoBloc;

  @override
  void initState() {
    super.initState();

    _videoBloc = VideoBloc();
    _videoBloc.inputVideo.add(Get10Videos());
  }

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      page: Scaffold(
        appBar: GlobalAppBar(
          showcategory: true,
        ),
        body: Column(
          children: [
            StreamBuilder(
              stream: _videoBloc.outputVideo,
              builder: (context, state) {
                if (state.data is VideoLoadingState) {
                  return Expanded(
                    child: GlobalShimmer(
                      itemCont: 10,
                      direction: Axis.vertical,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .3,
                      padding: EdgeInsets.only(bottom: 10),
                      bordervalue: 5,
                    ),
                  );
                } else if (state.data is VideoLoadedState) {
                  List vidoes = state.data?.videos ?? [];

                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                      itemCount: vidoes.length,
                      itemBuilder: (context, index) {
                        var video = vidoes[index];
                        return CardVideo(
                          title: video.title,
                          channelTitle: video.channelTitle,
                          publishDate: video.publishDate,
                          thumbnail: video.thumbnail,
                          channelThumbnail: video.channelThumbnail,
                          duration: video.duration,
                          viewsValue: video.viewsValue,
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Videos not found!!"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
