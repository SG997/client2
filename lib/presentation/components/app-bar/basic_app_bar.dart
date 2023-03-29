import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class BasicAppBar extends AppBar {
  final String? titleText;

  BasicAppBar({super.key, this.titleText});

  @override
  Widget? get title {
    return Label(
      text: titleText,
      weight: FontWeight.bold,
      size: 16,
      color: UIColor.black,
    );
  }

  @override
  Widget? get leading {
    if (Navigation.canPop) {
      return IconButton(
        onPressed: () => Navigation.pop(),
        icon: const Icon(Icons.arrow_back_rounded),
      );
    }

    return null;
  }
}
