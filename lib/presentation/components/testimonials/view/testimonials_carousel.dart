import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/controller/testimonials_controller.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/model/testimonials_item_representable.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class TestimonialsCarousel extends StatelessWidget {
  final TestimonialsController? carouselController;
  final double? padding;
  final Function(TestimonialsItemRepresentable?)? onPageChanged;
  final PageController? controller;

  const TestimonialsCarousel({
    Key? key,
    this.carouselController,
    this.onPageChanged,
    this.controller,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TestimonialsItemRepresentable>>(
      stream: carouselController?.itemsStream,
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.32,
          child: PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              carouselController?.updateIndex(index);
            },
            itemCount: items.length,
            pageSnapping: true,
            itemBuilder: (context, index) {
              final item = items[index];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(item.imagePath ?? ""),
                  ),
                  const Space(height: 8),
                  Label(
                    text: item.userName ?? "",
                    size: 14,
                    weight: FontWeight.w700,
                    color: UIColor.black,
                  ),
                  const Space(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
                    child: Label(
                      text: item.description ?? "",
                      align: TextAlign.center,
                      size: 18,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
