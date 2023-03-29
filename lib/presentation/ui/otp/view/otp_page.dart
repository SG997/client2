import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/otp/cubit/otp_view_model.dart';

part 'back_and_next_button.dart';
part 'otp_body.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

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
        leading: IconButton(
          onPressed: () => Navigation.pop(),
          color: UIColor.white,
          icon: const Icon(Icons.close),
        ),
      ),
      body: const OtpBody(),
    );
  }
}
