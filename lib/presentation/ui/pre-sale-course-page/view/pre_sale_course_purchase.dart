import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/label/price_label.dart';

class PreSaleCoursePurchase extends StatelessWidget {
  const PreSaleCoursePurchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PriceLabel(
            hasDiscount: true,
            price: "55",
            discountPrice: "95",
          ),
          SizedBox(
            width: 137,
            height: 42,
            child: PrimaryButton(
              title: "Buy it now",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
