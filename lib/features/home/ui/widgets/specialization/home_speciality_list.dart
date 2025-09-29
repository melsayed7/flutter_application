import 'package:flutter/material.dart';
import 'package:flutter_application/core/helper/spacing.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_application/core/theming/styles.dart';
import 'package:flutter_application/features/home/data/model/specializations_response_model.dart';
import 'package:flutter_application/features/home/logic/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSpecialityList extends StatefulWidget {
  final List<SpecializationsData?>? specializationsDataList;

  HomeSpecialityList({super.key, required this.specializationsDataList});

  @override
  State<HomeSpecialityList> createState() => _HomeSpecialityListState();
}

class _HomeSpecialityListState extends State<HomeSpecialityList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList?.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            context.read<HomeCubit>().getDoctorsList(
                  specID: widget.specializationsDataList?[index]?.id,
                );
          },
          child: customSpecialityItem(
              widget.specializationsDataList![index]!, index, selectedIndex),
        ),
      ),
    );
  }

  Widget customSpecialityItem(SpecializationsData specializationsDataItem,
      int currentIndex, int selectedIndex) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: currentIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          selectedIndex == currentIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.lightBlue,
                    child: Image.asset(
                      AppImages.doctorIcon,
                      height: 42.h,
                      width: 42.w,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.lightBlue,
                  child: Image.asset(
                    AppImages.doctorIcon,
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          heightSpace(12.h),
          selectedIndex == currentIndex
              ? Text(
                  specializationsDataItem.name,
                  style: AppStyles.font14DarkBlueMedium,
                )
              : Text(
                  specializationsDataItem.name,
                  style: AppStyles.font12DarkBlueRegular,
                )
        ],
      ),
    );
  }
}
