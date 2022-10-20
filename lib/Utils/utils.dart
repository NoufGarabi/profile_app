import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Utils {
  static Future capture(GlobalKey key) async {
    RenderRepaintBoundary boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage(pixelRatio: 15.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData?.buffer.asUint8List();

    return pngBytes;
  }

  static void shareInvAsPNG(
      {required Uint8List bytes, required BuildContext context}) async {
    var dir;
    if (Platform.isIOS) {
      // Platform is imported from 'dart:io' package
      dir = await getApplicationDocumentsDirectory();
    } else if (Platform.isAndroid) {
      dir = await getExternalStorageDirectory();
    }
    final imagePath = dir!.path + '/profile.png';
    File imageFile = File(imagePath);

    final message = ((DateTime.now().hour >= 0 && DateTime.now().hour < 12)
        ? 'صباح الخير'
        : 'مساء الخير' + '\nيسعدني حضورك');

    if (!await imageFile.exists()) {
      imageFile.create(recursive: true);
    }
    imageFile.writeAsBytesSync(bytes);

    Share.shareFiles([imagePath], text: message);
  }
}
