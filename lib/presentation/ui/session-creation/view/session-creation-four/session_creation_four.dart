import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/view/session-creation-four/session_creation_four_button.dart';

class SessionCreationFour extends StatelessWidget {
  const SessionCreationFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: const [
            Label(
              text: "Your new session is ready",
              weight: FontWeight.bold,
              size: 18,
            ),
            Space(height: 24),
            SessionCard(
              videoState: VideoState.uploaded,
            ),
            SessionCreationFourButtons(),
          ],
        ),
      ),
    );
  }
}
