import 'package:flutter/material.dart';
import 'package:youtube_clone/styles/colores.dart';
import 'package:youtube_clone/styles/textstyles.dart';
import 'package:intl/intl.dart';

class CardVideo extends StatelessWidget {
  const CardVideo(
      {super.key,
      required this.title,
      required this.channelTitle,
      required this.publishDate,
      required this.thumbnail,
      required this.duration,
      required this.viewsValue,
      required this.channelThumbnail});
  final String title;
  final String channelTitle;
  final DateTime publishDate;
  final String thumbnail;
  final String channelThumbnail;
  final String duration;
  final String viewsValue;

  @override
  Widget build(BuildContext context) {
    String formattedDuration = formatDuration(duration);
    String formattedDate = DateFormat('dd/MM/yyyy').format(publishDate);
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(thumbnail),
                fit: BoxFit.contain,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
               decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(6)
                ),
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  formattedDuration,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              title,
              style: white_normal_text16,
            ),
            subtitle: Text(
              "${channelTitle} • $viewsValue views • $formattedDate ",
              style: grey700_normal_text12,
            ),
            leading: CircleAvatar(),
            trailing: Icon(
              Icons.more_horiz_outlined,
              color: my_grey400,
            ),
          )
        ],
      ),
    );
  }

  String formatDuration(String iso8601Duration) {
    final regex = RegExp(r'^PT(\d+H)?(\d+M)?(\d+S)?$');
    final match = regex.firstMatch(iso8601Duration);

    if (match == null) {
      return 'Unknown';
    }

    final hours = match.group(1)?.replaceFirst('H', '') ?? '0';
    final minutes = match.group(2)?.replaceFirst('M', '') ?? '0';
    final seconds = match.group(3)?.replaceFirst('S', '') ?? '0';

    final hoursInt = int.parse(hours);
    final minutesInt = int.parse(minutes);
    final secondsInt = int.parse(seconds);

    final buffer = StringBuffer();

    if (hoursInt > 0) {
      buffer.write('${hoursInt}: ');
    }

    if (minutesInt > 0) {
      buffer.write('${minutesInt}: ');
    }

    if (secondsInt > 0 || buffer.isEmpty) {
      buffer.write('${secondsInt}');
    }

    return buffer.toString().trim();
  }
}
