import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';

class CourseChatImageFullScreen extends StatelessWidget {
  final IMessage message;
  const CourseChatImageFullScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: UIColor.white,
          ),
          onPressed: () => Navigation.pop(),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: UIColor.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: UIColor.white),
        title: Label(text: message.text, size: 18),
      ),
      body: PhotoView(
        imageProvider: FileImage(File(message.mediaUrl ?? "")),
      ),
    );
  }
}
