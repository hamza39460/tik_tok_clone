import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/globals/app_colors.dart';
import 'package:tiktok_clone/globals/app_text_styles.dart';
import 'package:tiktok_clone/globals/images.dart';
import 'package:tiktok_clone/globals/utils.dart';

class SideIcons extends StatelessWidget {
  const SideIcons({
    super.key,
    required this.avatarIcon,
  });
  final String avatarIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 30),
                if (avatarIcon.isNotEmpty) ...[
                  Image.network(
                    avatarIcon,
                    width: 45.sp,
                    height: 45.sp,
                  ),
                  const Spacer(),
                ],
                Image.asset(
                  Images.favorite,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomText.sfProRounded(
                  '87',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.white,
                ),
                const Spacer(),
                Image.asset(
                  Images.comments,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomText.sfProRounded(
                  '2',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.white,
                ),
                const Spacer(),
                Image.asset(
                  Images.share,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomText.sfProRounded(
                  '17',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.white,
                ),
                const Spacer(),
                Image.asset(
                  Images.tag,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomText.sfProRounded(
                  '203',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.white,
                ),
                const Spacer(),
                Image.asset(
                  Images.rotate,
                  width: 45.sp,
                  height: 45.sp,
                ),
                CustomText.sfProRounded(
                  'Flip',
                  fontWeight: FontWeight.w400,
                  size: 12.sp,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
