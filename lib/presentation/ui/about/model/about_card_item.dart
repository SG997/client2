import 'package:unimastery_mobile/presentation/components/list/model/team_list_item_delegate.dart';

class AboutCardItem implements TeamListItemDelegate {
  @override
  String? description;

  @override
  String? imagePath;

  @override
  String? userName;

  AboutCardItem({
    this.description,
    this.imagePath,
    this.userName,
  });
}
