import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/classes/class-item/class_item_bottom.dart';
import 'package:unimastery_mobile/presentation/components/classes/class-item/class_item_list.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';

class ClassItemBody extends StatelessWidget {
  final List<InfoModel> info;
  final VoidCallback? onTapHeader;
  const ClassItemBody({Key? key, required this.info, this.onTapHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Column(
        children: [
          AcademyCourseHeader(
            isAvatarSmall: true,
            coverImage: const AssetImage(Assets.dummy1),
            onTapHeader: onTapHeader,
            onTapBookmark: () {},
            hasBookmark: true,
            containsShadowAndRadius: false,
            avatarImage: const NetworkImage("https://rb.gy/j0scnj"),
            title: "Trading Academy",
            subtitle: "Forex 0 to 100 get yourself together",
            isEditable: true,
            typeTitle: "Workshop",
          ),
          const Space(height: 24),
          ClassItemList(info: info),
          const Space(height: 24),
          const ClassItemBottom(),
          const Space(height: 18),
        ],
      ),
    );
  }
}
