import 'package:unimastery_mobile/presentation/components/testimonials/model/testimonials_item_representable.dart';

class AboutItem implements TestimonialsItemRepresentable {
  @override
  String? description;

  @override
  String? imagePath;

  @override
  String? userName;

  AboutItem({
    this.description,
    this.imagePath,
    this.userName,
  });
}
