import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/controller/chat_input_controller.dart';

class ChatInput extends StatelessWidget {
  final ChatInputController? inputController;
  final Function(String)? onTextChanged;
  final bool? autoFocus;
  final Function(String?)? onSubmit;
  final IconData? icon1;
  final IconData? icon2;
  final IconData? icon3;
  final bool? isVisible;
  final bool? isReply;
  final VoidCallback? onTapCamera;
  final VoidCallback? onTap;
  final VoidCallback? onReplyTap;
  final String? replyTitle;
  final String? replySubtitle;
  final VoidCallback? onTapSend;
  final VoidCallback? onTapMicrophone;
  final String? userImage;
  final bool? isUpload;
  final VoidCallback? onTapClose;
  final ImageProvider? image;
  final VoidCallback? onTapAdd;
  final VoidCallback? didTapFile;
  final VoidCallback? didTapVideo;
  final VoidCallback? didTapPhoto;
  final bool? isAddition;

  const ChatInput({
    Key? key,
    this.onTextChanged,
    this.autoFocus = false,
    this.onSubmit,
    this.icon1,
    this.icon2,
    this.icon3,
    this.isVisible,
    this.onTap,
    this.onTapCamera,
    this.isReply,
    this.onReplyTap,
    this.replyTitle,
    this.replySubtitle,
    this.onTapSend,
    this.userImage,
    this.isUpload,
    this.onTapClose,
    this.image,
    this.onTapMicrophone,
    this.didTapFile,
    this.didTapVideo,
    this.didTapPhoto,
    this.isAddition,
    this.onTapAdd,
    this.inputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ChatInputReplyItem(
        //   userImage: userImage,
        //   onReplyTap: onReplyTap,
        //   replyTitle: replyTitle,
        //   replySubtitle: replySubtitle,
        //   isReply: true,
        // ),
        // ChatInputUploadImage(
        //   image: image,
        //   isUpload: isUpload,
        //   onClosedTap: onTapClose,
        // ),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: UIColor.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 0),
              ),
            ],
            color: UIColor.white,
          ),
          child: ChatInputItem(
            onTapMicrophone: onTapMicrophone,
            onTapCamera: onTapCamera,
            onTapAdd: onTapAdd,
            onTapSend: onTapSend,
            onTap: onTap,
            autoFocus: autoFocus,
            inputController: inputController,
            onSubmit: onSubmit,
            icon3: icon3,
            icon2: icon2,
            icon1: icon1,
          ),
        ),
      ],
    );
  }
}
