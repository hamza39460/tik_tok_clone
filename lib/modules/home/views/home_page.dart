import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/enums/home_section.dart';
import 'package:tiktok_clone/globals/app_colors.dart';
import 'package:tiktok_clone/globals/app_constants.dart';
import 'package:tiktok_clone/globals/app_text_styles.dart';
import 'package:tiktok_clone/globals/global_providers.dart';
import 'package:tiktok_clone/globals/utils.dart';
import 'package:tiktok_clone/models/following_model.dart';
import 'package:tiktok_clone/modules/home/state/home_state.dart';
import 'package:tiktok_clone/modules/home/widgets/home_following.dart';
import 'package:tiktok_clone/modules/home/widgets/home_for_you.dart';
import 'package:tiktok_clone/widgets/bottom_nav_bar.dart';
import 'package:tiktok_clone/widgets/play_list_container.dart';
import 'package:tiktok_clone/widgets/side_icon_playlist_container.dart';
import 'package:tiktok_clone/widgets/top_row.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeSection = ref.watch(homeScreenCurrentSectionProvider);
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Container(
        height: Utils.screenHeight,
        width: Utils.screenWidth,
        decoration: const BoxDecoration(
          gradient: AppColors.globalGradient,
        ),
        child: Column(
          children: [
            const SafeArea(
              child: CustomTopBar(),
            ),
            Expanded(
              child: homeSection == HomeSection.following
                  ? const HomeFollowingView()
                  : const HomeForYou(),
            ),
          ],
        ),
      ),
    );
  }
}
