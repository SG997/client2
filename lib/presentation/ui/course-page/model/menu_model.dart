import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/title_icon.dart';

class MenuModel implements TitleIcon {
  @override
  final String title;
  @override
  final String icon;
  @override
  final RouteName route;

  MenuModel({
    required this.title,
    required this.icon,
    required this.route,
  });
}
