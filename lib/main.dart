import 'package:asyn_task/DownloadProvider.dart';
import 'package:asyn_task/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DownloadProvider()),
      ],
      child: const FileDownloadSync(),
    ),
  );
}

class FileDownloadSync extends StatefulWidget {
  const FileDownloadSync({super.key});

  @override
  State<FileDownloadSync> createState() => _FileDownloadSyncState();
}

class _FileDownloadSyncState extends State<FileDownloadSync> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ASyn Task"),
          leading: const Icon(Icons.construction),
          // backgroundColor: Colors.blue,
        ),
        body: MainPage(),
      ),
    );
  }
}
