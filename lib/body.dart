import 'package:flutter/material.dart';
import 'package:asyn_task/file_download_view.dart';

class MyBody extends StatefulWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  int fileVal1 = 0;
  int fileVal2 = 0;
  int fileVal3 = 0;
  String stDownload = "Incomplete";

  void syncPrograming() async {
    while (fileVal1 < 100 || fileVal2 < 100 || fileVal3 < 100) {
      setState(() {
        fileVal1++;
        fileVal2++;
        fileVal3++;
        if (fileVal1 == 100 && fileVal2 == 100 && fileVal3 == 100) {
          stDownload = "Completed";
        }
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  Future<void> asyncPrograming() async {
    await Future.delayed(const Duration(milliseconds: 200));
    while (fileVal1 < 100) {
      setState(() {
        fileVal1++;
        if (fileVal1 == 100) {
          stDownload = "Completed";
        }
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }

    await Future.delayed(const Duration(milliseconds: 100));
    while (fileVal3 < 100) {
      setState(() {
        fileVal3++;
        if (fileVal3 == 100) {
          stDownload = "Completed";
        }
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }
    await Future.delayed(const Duration(milliseconds: 100));
    while (fileVal2 < 100) {
      setState(() {
        fileVal2++;
        if (fileVal2 == 100) {
          stDownload = "Completed";
        }
      });
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

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
                  fileDownloadView(val: "File Downloaded $fileVal1 %"),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: fileVal1 / 100,
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
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
                  fileDownloadView(val: "File Downloaded $fileVal2 %"),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: fileVal2 / 100,
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
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
                  fileDownloadView(val: "File Downloaded $fileVal3 %"),
                  const SizedBox(
                    height: 5,
                  ),
                  LinearProgressIndicator(
                    value: fileVal3 / 100,
                    backgroundColor: Colors.grey,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
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
          onTap: syncPrograming,
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
          onTap: asyncPrograming,
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
          child: Center(child: Text("Download $stDownload")),
        ),
      ],
    );
  }
}
