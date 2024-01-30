import 'package:asyn_task/DownloadProvider.dart';
import 'package:flutter/material.dart';
import 'package:asyn_task/file_download_view.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  fileDownloadView(
                      val:
                          "Image Downloaded ${(context.watch<DownloadProvider>().countDownloadImage*100).toStringAsFixed(0)}%"),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: context.watch<DownloadProvider>().countDownloadImage,
                    backgroundColor: Colors.grey,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  fileDownloadView(
                      val:
                          "Music Downloaded ${(context.watch<DownloadProvider>().countDownloadMusic*100).toStringAsFixed(0)}%"),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: context.watch<DownloadProvider>().countDownloadMusic,
                    backgroundColor: Colors.grey,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  fileDownloadView(
                      val:
                          "Video Downloaded ${(context.watch<DownloadProvider>().countDownloadVideo*100).toStringAsFixed(0)}%"),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: context.watch<DownloadProvider>().countDownloadVideo,
                    backgroundColor: Colors.grey,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            context.read<DownloadProvider>().syncPrograming();
          },
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width / 3.5,
            color: Colors.indigo,
            child: const Center(child: Text("Sync Download")),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            context.read<DownloadProvider>().asyncPrograming();
          },
          child: Container(
            height: 30,
            width: MediaQuery.of(context).size.width / 3.5,
            color: Colors.redAccent,
            child: const Center(child: Text("ASync Download")),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width / 3.5,
          color: Colors.purple,
          child: Center(child: Text(context.watch<DownloadProvider>().status)),
        ),
      ],
    );
  }
}
