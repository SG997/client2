import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';

class SessionCreationOne extends StatelessWidget {
  const SessionCreationOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionCreationCubit = context.read<SessionCreationCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Label(
            text: "What session do you want to create?",
            weight: FontWeight.bold,
            size: 18,
          ),
          const Space(height: 32),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.6,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (_, index) {
                      final sessionTypes = sessionCreationCubit.sessionTypes ?? [];
                      return OptionSelectorButton(
                        hasIcon: true,
                        title: sessionTypes[index].title,
                        icon: sessionTypes[index].icon,
                        onTap: () => sessionCreationCubit.setPage(
                          index: 1,
                          option: sessionTypes[index].option,
                        ),
                      );
                    },
                    childCount: sessionCreationCubit.sessionTypes?.length,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Space(height: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
