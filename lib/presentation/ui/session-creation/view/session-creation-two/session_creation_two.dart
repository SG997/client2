import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';

class SessionCreationTwo extends StatelessWidget {
  const SessionCreationTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionCreationCubit = context.read<SessionCreationCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Label(
              text: "Let’s do it",
              weight: FontWeight.bold,
              size: 18,
            ),
            const Space(height: 16),
            StreamBuilder<SessionCreationOption?>(
              stream: sessionCreationCubit.sessionCreationOptionStream,
              builder: (context, option) {
                return Column(
                  children: [
                    Label(
                      text: option.data?.title ?? "",
                      size: 12,
                      color: UIColor.black.withOpacity(0.5),
                    ),
                    const Space(height: 10),
                    StreamBuilder<String>(
                      stream: sessionCreationCubit.clipBoardTextStream,
                      builder: (context, clipBoard) {
                        return MultilineTextField(
                          controller: sessionCreationCubit.textEditingController,
                          hintText: "Type...",
                          onTextChanged: (value) {},
                          suffixIcon: option.data == SessionCreationOption.link
                              ? clipBoard.hasData
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: UIColor.black.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: CupertinoButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              sessionCreationCubit.paste();
                                            },
                                            child: Label(
                                              text: "Paste",
                                              color: UIColor.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : null
                              : null,
                        );
                      },
                    ),
                    const Space(height: 16),
                  ],
                );
              },
            ),
            NextBackButton(
              onNext: () {
                FocusScope.of(context).unfocus();
                sessionCreationCubit.setPage(index: 2);
              },
              onBack: () {
                sessionCreationCubit.setPage(index: 0);
                sessionCreationCubit.clearText();
              },
            ),
          ],
        ),
      ),
    );
  }
}
