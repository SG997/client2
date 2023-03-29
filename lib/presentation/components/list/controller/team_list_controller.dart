import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/presentation/components/list/model/team_list_item_delegate.dart';

class TeamListController {
  final _itemsController = BehaviorSubject<List<TeamListItemDelegate>>.seeded([]);

  TeamListController({required List<TeamListItemDelegate> items}) {
    add(items);
  }

  Stream<List<TeamListItemDelegate>> get itemsStream => _itemsController.stream;

  add(List<TeamListItemDelegate> items) => _itemsController.add(items);

  close() {
    _itemsController.close();
  }
}
