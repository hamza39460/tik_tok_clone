import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/globals/app_colors.dart';
import 'package:tiktok_clone/globals/app_text_styles.dart';
import 'package:tiktok_clone/globals/global_providers.dart';

class TimerWidget extends ConsumerWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: AppColors.white.withOpacity(0.60),
          size: 20.sp,
        ),
        const SizedBox(width: 4),
        CustomText.sfProRounded(
          "$timer min",
          fontWeight: FontWeight.w400,
          size: 16.sp,
          color: AppColors.white.withOpacity(0.60),
        )
      ],
    );
  }
}
