import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class SessionCardBottomCredentials extends StatelessWidget {
  final String? path;
  final String? name;
  final String? date;
  const SessionCardBottomCredentials({
    Key? key,
    this.path,
    this.name,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(path ?? ''),
        ),
        const Space(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Label(
              text: name,
              size: 12,
              color: UIColor.black.withOpacity(0.5),
            ),
            Label(
              text: date,
              size: 10,
              color: UIColor.black.withOpacity(0.5),
            ),
          ],
        ),
      ],
    );
  }
}
