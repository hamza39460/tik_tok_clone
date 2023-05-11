import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/globals/app_colors.dart';
import 'package:tiktok_clone/globals/app_constants.dart';
import 'package:tiktok_clone/globals/app_text_styles.dart';
import 'package:tiktok_clone/globals/global_providers.dart';
import 'package:tiktok_clone/globals/utils.dart';
import 'package:tiktok_clone/models/following_model.dart';
import 'package:tiktok_clone/modules/home/state/home_state.dart';
import 'package:tiktok_clone/widgets/play_list_container.dart';
import 'package:tiktok_clone/widgets/side_icon_playlist_container.dart';

class HomeFollowingView extends ConsumerStatefulWidget {
  const HomeFollowingView({
    super.key,
  });

  @override
  ConsumerState<HomeFollowingView> createState() => _FollowingViewState();
}

class _FollowingViewState extends ConsumerState<HomeFollowingView> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).getFollowing();
      _pageController.addListener(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(homeProvider);
        if (state is HomeLoaded) {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            itemCount: 10,
            itemBuilder: (context, index) {
              if (state.followingModel == null) return Container();
              return Column(
                children: [
                  Expanded(
                    child: _FlashCard(
                      followingModel: state.followingModel!,
                    ),
                  ),
                  PlayListContainer(
                    playlist: state.followingModel!.playlist ?? "",
                  ),
                ],
              );
            },
          );
        } else if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.white,
            ),
          );
        } else if (state is HomeError) {
          return CustomText.sfProRounded(state.message,
              color: AppColors.white, fontWeight: FontWeight.w700, size: 12.sp);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class _FlashCard extends StatefulWidget {
  _FlashCard({
    super.key,
    required this.followingModel,
  });

  final FollowingModel followingModel;

  @override
  State<_FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<_FlashCard> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                showAnswer = !showAnswer;
              });
            },
            child: Container(
              height: Utils.screenHeight,
              width: Utils.screenWidth,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: !showAnswer
                  ? Center(
                      child: _flashCardFront(),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _flashCardFront(),
                          const Spacer(flex: 2),
                          Container(
                            width: Utils.screenWidth * 0.80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.white.withOpacity(0.20),
                                width: 1,
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                          CustomText.sfProRounded(
                            AppConstants.answer,
                            fontWeight: FontWeight.w800,
                            size: 13.sp,
                            color: AppColors.shamrock,
                          ),
                          const Spacer(flex: 1),
                          CustomText.sfProRounded(
                            widget.followingModel.flashcardBack ?? "",
                            fontWeight: FontWeight.w400,
                            size: 21.sp,
                            color: AppColors.white.withOpacity(0.70),
                          ),
                          const Spacer(flex: 3),
                          CustomText.sfProRounded(
                            AppConstants.howWellDidYouKnowThis,
                            fontWeight: FontWeight.w400,
                            size: 15.sp,
                            color: AppColors.white.withOpacity(0.60),
                          ),
                          const Spacer(flex: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _ratingContainer("1", AppColors.tango),
                              _ratingContainer("2", AppColors.rajah),
                              _ratingContainer("3", AppColors.musturd),
                              _ratingContainer("4", AppColors.eden),
                              _ratingContainer("5", AppColors.emerald),
                            ],
                          ),
                          const Spacer(flex: 2),
                          CustomText.sfProRounded(
                            widget.followingModel.user?.name ?? "",
                            fontWeight: FontWeight.w400,
                            size: 18.sp,
                            color: AppColors.white,
                          ),
                          const Spacer(flex: 1),
                          CustomText.sfProRounded(
                            widget.followingModel.description ?? "",
                            fontWeight: FontWeight.w400,
                            size: 15.sp,
                            color: AppColors.white,
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                    ),
            ),
          ),
        ),
        SideIcons(
          avatarIcon: widget.followingModel.user?.avatar ?? "",
        ),
      ],
    );
  }

  Container _ratingContainer(String rating, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomText.sfProRounded(
        rating,
        fontWeight: FontWeight.w600,
        size: 17.sp,
        color: AppColors.white,
      ),
    );
  }

  Widget _flashCardFront() {
    return CustomText.sfProRounded(
      widget.followingModel.flashcardFront ?? "",
      fontWeight: FontWeight.w400,
      size: 21.sp,
      color: AppColors.white,
      height: 1.5,
    );
  }
}
