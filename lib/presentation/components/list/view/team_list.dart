import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/list/controller/team_list_controller.dart';
import 'package:unimastery_mobile/presentation/components/list/model/team_list_item_delegate.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class TeamList extends StatelessWidget {
  final TeamListController? cardController;

  const TeamList({Key? key, this.cardController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TeamListItemDelegate>>(
      stream: cardController?.itemsStream,
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final item = items[index];
              return Container(
                decoration: BoxDecoration(
                  color: UIColor.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: UIColor.spanishGray.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 16,
                      // offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(item.imagePath ?? ""),
                    ),
                    const Space(height: 12),
                    Label(
                      text: item.userName ?? "",
                      size: 14,
                      weight: FontWeight.w600,
                      color: UIColor.black,
                      align: TextAlign.center,
                    ),
                    const Space(height: 8),
                    Label(
                      text: item.description ?? "",
                      size: 10,
                      weight: FontWeight.w800,
                      color: UIColor.ultramarineBlue,
                    ),
                  ],
                ),
              );
            },
            childCount: items.length,
          ),
        );
      },
    );
  }
}
