import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/bottom-sheet/main/bottom_sheet_presenter.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PrimaryAppBar extends AppBar {
  final String? imagePath;
  final String? titleText;

  PrimaryAppBar({
    Key? key,
    this.titleText,
    this.imagePath,
  }) : super(key: key);

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

  @override
  bool? get centerTitle => false;

  @override
  Widget? get title {
    if (titleText == null) return null;

    return Label(
      text: titleText,
      color: UIColor.black,
      size: 28,
      weight: FontWeight.bold,
    );
  }

  @override
  List<Widget>? get actions => [
        IconButton(
          splashRadius: 24,
          onPressed: () {},
          icon: SvgPicture.asset(Assets.search),
        ),
        IconButton(
          splashRadius: 24,
          onPressed: () {},
          icon: SvgPicture.asset(Assets.message),
        ),
        IconButton(
          splashRadius: 24,
          onPressed: () {},
          icon: SvgPicture.asset(Assets.bell),
        ),
        const Space(width: 8),
        GestureDetector(
          onTap: () {
            BottomSheetPresenter.showHomeBottomSheet(
              Navigation.context,
              description: "36 Belt-Dagon, Israel",
              image: "https://rb.gy/j0scnj",
              title: "Noam Altshuler-Cohen",
            );
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(imagePath ?? "https://rb.gy/j0scnj"),
          ),
        ),
        const Space(width: 16)
      ];
}
