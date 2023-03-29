import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/login/view-model/login_view_model.dart';
import 'package:unimastery_mobile/presentation/util/config.dart';

part 'bottom_holder.dart';
part 'dynamic_space.dart';
part 'login_body.dart';
part 'login_button.dart';
part 'motto_text.dart';
part 'next_button.dart';
part 'phone_number_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: UIColor.clear,
        title: const Logo(
          scale: 3,
          axis: Axis.horizontal,
        ),
      ),
      body: const LoginBody(),
    );
  }
}
