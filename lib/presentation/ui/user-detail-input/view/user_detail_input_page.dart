import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/cubit/user_detail_input_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/view/user_detail_input_body.dart';
import 'package:unimastery_mobile/presentation/util/config.dart';

class UserDetailInputPage extends StatelessWidget {
  const UserDetailInputPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetailInputCubit = context.read<UserDetailInputCubit>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: UIColor.clear,
        title: StreamBuilder<bool>(
          stream: userDetailInputCubit.keyboardVisibilityStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final isVisible = snapshot.data == true;
            return isVisible && Config.isSmallScreen ? const SizedBox.shrink() : const Logo(axis: Axis.horizontal);
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          color: UIColor.white,
          onPressed: () => Navigation.pop(),
        ),
      ),
      body: const UserDetailInputBody(),
    );
  }
}
