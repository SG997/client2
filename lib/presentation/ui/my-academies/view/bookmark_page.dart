import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/my-academies/view/bookmark_body.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: UIColor.white,
      body: BookMarkBody(),
    );
  }
}
