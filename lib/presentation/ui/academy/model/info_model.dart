import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';

class InfoModel {
  final String text;
  final String subtext;
  final String icon;
  final InfoModelType? type;

  InfoModel({
    required this.text,
    required this.subtext,
    required this.icon,
    this.type,
  });
}
