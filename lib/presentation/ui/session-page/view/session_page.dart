import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/session/model/session_model.dart';
import 'package:unimastery_mobile/presentation/ui/session-page/view/session_body.dart';

class SessionPage extends StatelessWidget {
  final SessionModel session;
  final VoidCallback? didTapMessage;
  final VoidCallback? didTapLike;
  const SessionPage({
    Key? key,
    this.didTapMessage,
    required this.session,
    this.didTapLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: RepositoryProvider(
        create: (context) => locator.get<SessionController>(),
        child: SessionBody(
          didTapMessage: didTapMessage,
          didTapLike: didTapLike,
          session: session,
        ),
      ),
    );
  }
}
