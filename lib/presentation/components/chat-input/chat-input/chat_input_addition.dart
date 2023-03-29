import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/components/chat-input/chat-input/chat_input_add_item.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/viewmodel/chat_view_model.dart';

class ChatInputAddition extends StatelessWidget {
  final VoidCallback? didTapFile;
  final VoidCallback? didTapVideo;
  final VoidCallback? didTapPhoto;
  final String? fileTitle;
  final String? videoTitle;
  final String? photoTitle;
  final bool? isAddition;
  const ChatInputAddition({
    Key? key,
    this.didTapFile,
    this.didTapVideo,
    this.didTapPhoto,
    this.fileTitle,
    this.videoTitle,
    this.photoTitle,
    this.isAddition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatViewModel = context.watch<ChatViewModel>();
    return AnimatedSize(
      alignment: Alignment.bottomCenter,
      duration: const Duration(milliseconds: 250),
      child: Visibility(
        visible: chatViewModel.isMediaActionPending,
        child: Align(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.zero,
            elevation: 0,
            color: UIColor.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChatInputAddItem(
                  didTap: () {
                    chatViewModel.pickMedia(pickType: ImagePickerType.gallery, mediaType: MediaType.file);
                  },
                  icon: CupertinoIcons.doc_fill,
                  title: fileTitle,
                  size: 18,
                ),
                ChatInputAddItem(
                  didTap: () {
                    chatViewModel.pickMedia(pickType: ImagePickerType.gallery, mediaType: MediaType.image);
                  },
                  icon: CupertinoIcons.camera,
                  title: photoTitle,
                  size: 18,
                ),
                ChatInputAddItem(
                  didTap: () {
                    chatViewModel.pickMedia(pickType: ImagePickerType.gallery, mediaType: MediaType.video);
                  },
                  icon: CupertinoIcons.video_camera,
                  title: videoTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
