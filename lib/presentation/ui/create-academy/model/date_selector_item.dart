import 'package:unimastery_mobile/presentation/components/dropdown/model/dropdown_item_representable.dart';

class DateSelectorItem implements DropdownItemRepresentable {
  @override
  int? id;

  @override
  String? title;

  DateSelectorItem({
    this.title,
    this.id,
  });
}
