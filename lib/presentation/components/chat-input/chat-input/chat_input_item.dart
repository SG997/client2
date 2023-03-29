import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/controller/chat_input_controller.dart';

class ChatInputItem extends StatelessWidget {
  final bool? autoFocus;
  final Function(String?)? onSubmit;
  final IconData? icon1;
  final IconData? icon2;
  final IconData? icon3;
  final VoidCallback? onTapCamera;
  final VoidCallback? onTapSend;
  final VoidCallback? onTapMicrophone;
  final VoidCallback? onTapAdd;
  final VoidCallback? onTap;
  final ChatInputController? inputController;
  const ChatInputItem({
    Key? key,
    this.autoFocus,
    this.onSubmit,
    this.icon1,
    this.icon2,
    this.icon3,
    this.onTap,
    this.inputController,
    this.onTapSend,
    this.onTapCamera,
    this.onTapMicrophone,
    this.onTapAdd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: CupertinoButton(
            onPressed: onTapAdd,
            padding: EdgeInsets.zero,
            child: Icon(
              icon1 ?? CupertinoIcons.add,
              color: UIColor.black,
              size: 28,
            ),
          ),
        ),
        const Space(width: 8),
        ChatInputField(
          focusNode: inputController?.focusNode,
          controller: inputController?.textEditingController,
          autoFocus: false,
          onTextChanged: inputController?.onChange,
        ),
        StreamBuilder<ChatInputState>(
          stream: inputController?.chatInputStateStream,
          builder: (context, snapshot) {
            return Row(
              children: [
                if (snapshot.data != ChatInputState.empty)
                  CupertinoButton(
                    padding: const EdgeInsets.only(right: 16, left: 12),
                    onPressed: inputController?.sendMessage,
                    child: SvgPicture.asset(Assets.send),
                  ),
                if (snapshot.data == ChatInputState.empty)
                  CupertinoButton(
                    onPressed: onTapCamera,
                    padding: EdgeInsets.zero,
                    child: Icon(icon2 ?? CupertinoIcons.photo_camera, color: UIColor.black),
                  ),
                if (snapshot.data == ChatInputState.empty)
                  CupertinoButton(
                    onPressed: onTapMicrophone,
                    padding: EdgeInsets.zero,
                    child: Icon(icon3 ?? CupertinoIcons.mic, color: UIColor.black),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
