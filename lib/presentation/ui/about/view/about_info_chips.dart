import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/chip/info_chips.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/about/cubit/about_cubit.dart';

class AboutInfoChips extends StatelessWidget {
  const AboutInfoChips({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutCubit = context.read<AboutCubit>();
    final info = aboutCubit.info ?? [];
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Space(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: info.map((e) {
              return InfoChip(
                text: e.text,
                icon: e.icon,
                subText: e.subtext,
                isLast: false,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
