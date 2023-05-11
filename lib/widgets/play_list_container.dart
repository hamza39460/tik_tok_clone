import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/globals/app_colors.dart';
import 'package:tiktok_clone/globals/app_text_styles.dart';
import 'package:tiktok_clone/globals/images.dart';
import 'package:tiktok_clone/globals/utils.dart';

class PlayListContainer extends StatelessWidget {
  const PlayListContainer({super.key, required this.playlist});
  final String playlist;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.screenWidth,
      padding: const EdgeInsets.all(10),
      color: AppColors.white.withOpacity(0.20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            Images.playlist,
            height: 20.sp,
            width: 20.sp,
          ),
          const Spacer(),
          CustomText.sfProRounded(
            "Playlist: $playlist",
            fontWeight: FontWeight.w600,
            size: 13.sp,
            color: AppColors.white,
          ),
          const Spacer(
            flex: 10,
          ),
          Icon(
            Icons.navigate_next,
            color: AppColors.white,
            size: 20.sp,
          )
        ],
      ),
    );
  }
}
