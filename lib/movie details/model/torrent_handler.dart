import 'package:url_launcher/url_launcher.dart';

class TorrentHandler {
  final String torrentUrl;
  TorrentHandler({required this.torrentUrl});

  void openTorrent() async {
    if (await canLaunch(torrentUrl)) {
      await launch(torrentUrl);
    } else {
      throw Exception("Could not launch");
    }
  }
}