import 'package:flutter/material.dart';
import 'package:flutter_application/core/theming/app_colors.dart';
import 'package:flutter_application/core/theming/app_images.dart';
import 'package:flutter_application/features/calendar/calendar_screen.dart';
import 'package:flutter_application/features/home/ui/home_screen.dart';
import 'package:flutter_application/features/message/message_screen.dart';
import 'package:flutter_application/features/profile/profile_screen.dart';
import 'package:flutter_application/features/search/search_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/di/dependency_injection.dart';
import '../../home/logic/home_cubit.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;

  List<Widget> widgetPages = [
    BlocProvider(
      create: (context) => HomeCubit(getIt())..getSpecializations(),
      child: const HomeScreen(),
    ),
    MessageScreen(),
    SearchScreen(), // 🔍 center search page
    CalendarScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.homeSolidIcon),
            icon: SvgPicture.asset(AppImages.homeIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.messageSolidIcon),
            icon: SvgPicture.asset(AppImages.messageIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(28)),
              child: SvgPicture.asset(AppImages.search),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(AppImages.calendarSolidIcon),
            icon: SvgPicture.asset(AppImages.calendarIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.person , color: AppColors.blueColor),
            icon: SvgPicture.asset(AppImages.personalIcon),
            label: '',
          ),
        ],
      ),
    );
  }
}
