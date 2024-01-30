import 'package:flutter/cupertino.dart';

class DownloadProvider extends ChangeNotifier {
  double countDownloadMusic = 0.00;
  double countDownloadVideo = 0.00;
  double countDownloadImage = 0.00;
  String status = "Downloading";

  Future<void> _downloadMusic() async {
    for (double i = 0.00; i <= 1.01; i += 0.01) {
      await Future.delayed(const Duration(milliseconds: 100));
      countDownloadMusic = i;
      notifyListeners();
    }
  }

  Future<void> _downloadVideo() async {
    for (double i = 0.00; i <= 1.01; i += 0.01) {
      await Future.delayed(const Duration(milliseconds: 100));
      countDownloadVideo = i;
      notifyListeners();
    }
  }

  Future<void> _downloadImage() async {
    for (double i = 0.00; i <= 1.01; i += 0.01) {
      await Future.delayed(const Duration(milliseconds: 100));
      countDownloadImage = i;
      notifyListeners();
    }
  }

  Future<void> syncPrograming() async {
    await _downloadImage();
    await  _downloadMusic();
    await  _downloadVideo();
    if (countDownloadMusic >= 1.00 &&
        countDownloadVideo >= 1.00 &&
        countDownloadImage >= 1.00) {
      status = "Download Completed";
      notifyListeners();
    }
  }

  Future<void> asyncPrograming() async {
    await Future.wait([
      _downloadImage(),
      _downloadMusic(),
      _downloadVideo(),
    ]);
    if (countDownloadMusic >= 1.00 &&
        countDownloadVideo >= 1.00 &&
        countDownloadImage >= 1.00) {
      status = "Download Completed";
      notifyListeners();
    }
  }
}
