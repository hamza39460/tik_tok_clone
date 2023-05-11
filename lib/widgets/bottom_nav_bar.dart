import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/globals/app_colors.dart';
import 'package:tiktok_clone/globals/app_constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.daintree,
      unselectedItemColor: AppColors.white,
      selectedLabelStyle: TextStyle(
        fontSize: 10.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10.sp,
        color: AppColors.white.withOpacity(0.40),
        fontWeight: FontWeight.w500,
      ),
      currentIndex: 0,
      onTap: (_) {},
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: AppColors.white,
          ),
          label: AppConstants.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: AppConstants.leaderBoard,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: AppConstants.activity,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: AppConstants.bookmarks,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppConstants.profile,
        ),
      ],
    );
  }
}
