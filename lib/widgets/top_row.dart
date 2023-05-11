import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/enums/home_section.dart';
import 'package:tiktok_clone/globals/app_colors.dart';
import 'package:tiktok_clone/globals/app_constants.dart';
import 'package:tiktok_clone/globals/app_text_styles.dart';
import 'package:tiktok_clone/globals/global_providers.dart';
import 'package:tiktok_clone/widgets/timer.dart';

class CustomTopBar extends ConsumerWidget {
  const CustomTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSection = ref.watch(homeScreenCurrentSectionProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TimerWidget(),
          const Spacer(),
          InkWell(
            onTap: () {
              ref.read(homeScreenCurrentSectionProvider.notifier).state =
                  HomeSection.following;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _headingText(AppConstants.following),
                const SizedBox(height: 5),
                if (currentSection == HomeSection.following) _customUnderline(),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              ref.read(homeScreenCurrentSectionProvider.notifier).state =
                  HomeSection.forYou;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _headingText(AppConstants.forYou),
                const SizedBox(height: 5),
                if (currentSection == HomeSection.forYou) _customUnderline(),
              ],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.white,
          )
        ],
      ),
    );
  }

  Widget _headingText(String text) {
    return CustomText.sfProRounded(
      text,
      fontWeight: FontWeight.w700,
      size: 18.sp,
      color: AppColors.white,
    );
  }

  Widget _customUnderline() {
    return Container(
      width: 30,
      height: 4,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}
