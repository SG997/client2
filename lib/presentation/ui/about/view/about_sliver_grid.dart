import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/list/view/team_list.dart';
import 'package:unimastery_mobile/presentation/ui/about/cubit/about_cubit.dart';

class AboutSliverGrid extends StatelessWidget {
  const AboutSliverGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final aboutCubit = context.read<AboutCubit>();
    return TeamList(cardController: aboutCubit.cardController);
  }
}
