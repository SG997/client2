import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

enum BottomNavItem {
  home(Assets.homeSelected),
  graduation(Assets.graduationHatSelected),
  explore(Assets.exploreSelected),
  bookmark(Assets.bookmarkSelected);

  final String asset;

  const BottomNavItem(this.asset);
}

class PrimaryBottomNavbarController {
  final _indexController = BehaviorSubject<int>.seeded(0);

  Stream<int> get currentIndex => _indexController.stream;

  List<BottomNavItem> get items => BottomNavItem.values;

  change(int index) {
    _indexController.sink.add(index);
  }

  close() {
    _indexController.close();
  }
}
