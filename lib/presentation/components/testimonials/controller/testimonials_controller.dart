import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/model/testimonials_item_representable.dart';

class TestimonialsController {
  final _itemsController = BehaviorSubject<List<TestimonialsItemRepresentable>>.seeded([]);
  final _carouselIndexController = BehaviorSubject<int>.seeded(0);

  TestimonialsController({required List<TestimonialsItemRepresentable> items}) {
    add(items);
  }

  Stream<List<TestimonialsItemRepresentable>> get itemsStream => _itemsController.stream;

  Stream<int> get indexStream => _carouselIndexController.stream;

  add(List<TestimonialsItemRepresentable> items) => _itemsController.add(items);

  updateIndex(int index) {
    _carouselIndexController.sink.add(index);
  }

  close() {
    _itemsController.close();
    _carouselIndexController.close();
  }
}
