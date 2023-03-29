import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/controller/testimonials_controller.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/model/testimonials_item_representable.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PageIndicator extends StatelessWidget {
  final TestimonialsController? carouselController;
  const PageIndicator({
    Key? key,
    this.carouselController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: carouselController?.indexStream,
      builder: (context, snapshot) {
        return StreamBuilder<List<TestimonialsItemRepresentable>>(
          stream: carouselController?.itemsStream,
          builder: (context, carousel) {
            final items = carousel.data ?? [];
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.map((e) {
                bool isCurrentIndex = snapshot.data == items.indexOf(e);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: AnimatedContainer(
                    height: 7,
                    width: 7,
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: isCurrentIndex ? UIColor.ultramarineBlue : UIColor.lightSilver,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}
