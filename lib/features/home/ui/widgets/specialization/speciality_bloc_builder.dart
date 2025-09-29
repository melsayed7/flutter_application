import 'package:flutter/material.dart';
import 'package:flutter_application/features/home/ui/widgets/doctor/doctor_shimmer_loading.dart';
import 'package:flutter_application/features/home/ui/widgets/specialization/speciality_shimmer_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'home_speciality_list.dart';

class SpecialityBlocBuilder extends StatelessWidget {
  const SpecialityBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () =>  Expanded(
            child: Column(
              children: [
                const SpecialityShimmerLoading(),
                heightSpace(8),
                const DoctorsShimmerLoading(),
              ],
            ),
          ),
          specializationsSuccess: (specializationsList) {
            return HomeSpecialityList(
              specializationsDataList: specializationsList,
            );
          },
          specializationsError: (errorHandler) => const SizedBox.shrink(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
