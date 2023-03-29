import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/payment-history/view/payment_history_list_item.dart';

class PaymentHistoryList extends StatelessWidget {
  const PaymentHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Space(height: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: UIColor.cultured,
              child: const PaymentHistoryListItem(),
            ),
          );
        },
      ),
    );
  }
}
