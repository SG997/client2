import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/presentation/components/dropdown/model/dropdown_item_representable.dart';

class DropdownController {
  final _currencyController = BehaviorSubject<List<DropdownItemRepresentable>>.seeded([]);
  final _dateController = BehaviorSubject<List<DropdownItemRepresentable>>.seeded([]);
  final _selectedCurrencyController = BehaviorSubject<DropdownItemRepresentable>();
  final _selectedDateController = BehaviorSubject<DropdownItemRepresentable>();

  DropdownController({
    required List<DropdownItemRepresentable> currencyItem,
    required List<DropdownItemRepresentable> dateItem,
  }) {
    add(currencyItem, dateItem);
    if (currencyItem.isNotEmpty) selectCurrency(currencyItem.first);
    if (dateItem.isNotEmpty) selectDate(dateItem.first);
  }

  Stream<List<DropdownItemRepresentable>> get currencyStream => _currencyController.stream;

  Stream<List<DropdownItemRepresentable>> get dateStream => _dateController.stream;

  Stream<DropdownItemRepresentable> get selectedCurrencyStream => _selectedCurrencyController.stream;

  Stream<DropdownItemRepresentable> get selectedDateStream => _selectedDateController.stream;

  add(
    List<DropdownItemRepresentable> currencyItem,
    List<DropdownItemRepresentable> dateItem,
  ) {
    _currencyController.add(currencyItem);
    _dateController.add(dateItem);
  }

  selectCurrency(DropdownItemRepresentable? currency) {
    if (currency == null) return;
    _selectedCurrencyController.add(currency);
  }

  selectDate(DropdownItemRepresentable? date) {
    if (date == null) return;
    _selectedDateController.add(date);
  }

  close() {
    _currencyController.close();
    _selectedCurrencyController.close();
    _selectedDateController.close();
    _dateController.close();
  }
}
