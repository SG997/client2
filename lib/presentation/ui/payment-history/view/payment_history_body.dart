import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/payment-history/view/payment_history_list.dart';

class PaymentHistoryBody extends StatelessWidget {
  const PaymentHistoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Space(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Label(
                text: "Payment History",
                size: 22,
                weight: FontWeight.w700,
              ),
              Row(
                children: [
                  Label(text: "News first", size: 12, color: UIColor.black.withOpacity(0.5)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ],
          ),
        ),
        const Space(height: 24),
        const PaymentHistoryList(),
      ],
    );
  }
}
