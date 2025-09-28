import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_application/features/home/logic/home_cubit.dart';
import 'package:flutter_application/features/home/logic/home_state.dart';
import 'package:flutter_application/features/home/ui/widgets/home_doctor_container.dart';
import 'package:flutter_application/features/home/ui/widgets/home_doctor_list.dart';
import 'package:flutter_application/features/home/ui/widgets/home_doctor_speciality_list.dart';
import 'package:flutter_application/features/home/ui/widgets/home_tap_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            children: [
              const HomeTapBarWidget(),
              heightSpace(16.h),
              const HomeDoctorContainer(),
              heightSpace(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Doctor Speciality',
                    style: AppStyles.font18DarkBlueSemiBold,
                  ),
                  Text(
                    'See All',
                    style: AppStyles.font12BlueRegular,
                  ),
                ],
              ),
              heightSpace(16.h),
             BlocBuilder<HomeCubit , HomeState>(
               buildWhen: (previous, current) =>
               current is SpecializationsLoading ||
                   current is SpecializationsSuccess ||
                   current is SpecializationsError ,
                 builder: (context, state) {
                   return state.maybeWhen(
                     specializationsLoading: () => const SizedBox(
                       height: 100,
                       child: Center(
                         child: CircularProgressIndicator(),
                       ),
                     ),
                       specializationsSuccess: (specializationsResponseModel) {
                         var specializationsList = specializationsResponseModel.specializationDataList ;
                       return Expanded(
                         child: Column(
                           children: [
                             HomeDoctorSpecialityList(
                               specializationsDataList: specializationsList,
                             ),
                             heightSpace(8),
                             HomeDoctorList(
                               doctorModel: specializationsList[0].doctorModel,
                             ),
                           ],
                         ),
                       );
                       },
                       specializationsError: (errorHandler) => const SizedBox.shrink(),
                       orElse: () => const SizedBox.shrink(),
                   );
                 },
             ),
            ],
          ),
        ),
      ),
    );
  }
}
