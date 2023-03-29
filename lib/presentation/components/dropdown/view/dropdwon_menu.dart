import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/dropdown/controller/dropdown_controller.dart';
import 'package:unimastery_mobile/presentation/components/dropdown/model/dropdown_item_representable.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class DropdownMenu extends StatelessWidget {
  final DropdownController? dropdownController;
  final Stream<List<DropdownItemRepresentable>>? itemsStream;
  final Stream<DropdownItemRepresentable>? selectedItemStream;
  final Function(DropdownItemRepresentable?)? onChangeItem;
  final DropdownController? selected;
  final IconData? icon;
  final bool hasBorder;

  const DropdownMenu({
    Key? key,
    this.onChangeItem,
    this.hasBorder = true,
    this.dropdownController,
    this.itemsStream,
    this.selectedItemStream,
    this.icon,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DropdownItemRepresentable>>(
      stream: itemsStream,
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];
        return StreamBuilder<DropdownItemRepresentable>(
          stream: selectedItemStream,
          builder: (context, snapshot) {
            final selectedItem = snapshot.data;
            return SizedBox(
              height: 52,
              width: 169,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<DropdownItemRepresentable>(
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Label(
                      text: selectedItem?.title ?? "",
                      color: UIColor.black.withOpacity(0.5),
                      size: 12,
                    ),
                  ),
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 12),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 12),
                  items: items.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Row(
                        children: [
                          if (icon != null) Icon(icon),
                          Label(
                            text: valueItem.title ?? "None",
                            size: 12,
                            color: UIColor.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  value: selectedItem,
                  onChanged: (item) {
                    dropdownController;
                    if (onChangeItem != null) onChangeItem!(item);
                  },
                  dropdownMaxHeight: 250,
                  dropdownElevation: 0,
                  buttonDecoration: BoxDecoration(
                    color: hasBorder ? UIColor.brightGray : UIColor.clear,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  offset: const Offset(0, 8),
                  dropdownDecoration: BoxDecoration(
                    color: hasBorder ? UIColor.brightGray : UIColor.clear,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
