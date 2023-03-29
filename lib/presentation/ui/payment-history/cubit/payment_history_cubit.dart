import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';

abstract class PaymentHistoryCubit extends Cubit<GenericState> {
  PaymentHistoryCubit() : super(Initial());
}

class PaymentHistoryCubitImpl extends PaymentHistoryCubit {}
