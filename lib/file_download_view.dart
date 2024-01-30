import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fileDownloadView extends StatelessWidget {
  String val;
  fileDownloadView({super.key,required this.val});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: MediaQuery.of(context).size.width/3.2,
      color: Colors.white54,
      child: Text(val),
    );
  }
}
