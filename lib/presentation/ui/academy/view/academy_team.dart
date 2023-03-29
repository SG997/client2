import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/list/view/team_list.dart';
import 'package:unimastery_mobile/presentation/ui/academy/cubit/academy_cubit.dart';

class AcademyTeamGrid extends StatelessWidget {
  const AcademyTeamGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final academyCubit = context.read<AcademyPageCubit>();
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: TeamList(
        cardController: academyCubit.cardController,
      ),
    );
  }
}
