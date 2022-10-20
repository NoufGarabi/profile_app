import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:profile_app/Utils/utils.dart';
import 'package:profile_app/Utils/widget_to_image.dart';

class SharePage extends StatelessWidget {
  const SharePage(
      {super.key, required this.imageBytes, required this.imageWidget});
  final Uint8List imageBytes;
  final WidgetToImage imageWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageWidget,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: () async {
              Utils.shareInvAsPNG(
                bytes: imageBytes,
                context: context,
              );
            },
            child: const Text('Share'),
          )
        ],
      ),
    );
  }
}
