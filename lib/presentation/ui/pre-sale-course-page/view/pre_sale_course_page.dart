import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/app-bar/primary_app_bar.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/view/pre_sale_course_body.dart';

class PreSaleCoursePage extends StatelessWidget {
  const PreSaleCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: const PreSaleCourseBody(),
    );
  }
}
