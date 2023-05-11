import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/globals/app_colors.dart';
import 'package:tiktok_clone/globals/app_constants.dart';
import 'package:tiktok_clone/globals/app_text_styles.dart';
import 'package:tiktok_clone/globals/global_providers.dart';
import 'package:tiktok_clone/globals/utils.dart';
import 'package:tiktok_clone/models/following_model.dart';
import 'package:tiktok_clone/models/for_you_model.dart';
import 'package:tiktok_clone/modules/home/state/home_state.dart';
import 'package:tiktok_clone/widgets/play_list_container.dart';
import 'package:tiktok_clone/widgets/side_icon_playlist_container.dart';

class HomeForYou extends ConsumerStatefulWidget {
  const HomeForYou({
    super.key,
  });

  @override
  ConsumerState<HomeForYou> createState() => _FollowingViewState();
}

class _FollowingViewState extends ConsumerState<HomeForYou> {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).getForYou();
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
              if (state.forYouModel == null) return Container();
              return Column(
                children: [
                  Expanded(
                    child: _QuizCard(
                      forYouModel: state.forYouModel!,
                    ),
                  ),
                  PlayListContainer(
                    playlist: state.forYouModel!.playlist ?? "",
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

class _QuizCard extends StatefulWidget {
  _QuizCard({
    super.key,
    required this.forYouModel,
  });

  final ForYouModel forYouModel;

  @override
  State<_QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<_QuizCard> {
  String selectedId = "";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: Utils.screenHeight,
            width: Utils.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 5),
                  CustomText.sfProRounded(
                    widget.forYouModel.question ?? "",
                    fontWeight: FontWeight.w400,
                    size: 21.sp,
                    color: AppColors.white,
                    height: 1.5,
                  ),
                  const Spacer(flex: 20),
                  ..._optionsList(widget.forYouModel.options ?? []),
                  const Spacer(flex: 2),
                  CustomText.sfProRounded(
                    widget.forYouModel.user?.name ?? "",
                    fontWeight: FontWeight.w400,
                    size: 18.sp,
                    color: AppColors.white,
                  ),
                  const Spacer(flex: 1),
                  CustomText.sfProRounded(
                    widget.forYouModel.description ?? "",
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
        SideIcons(
          avatarIcon: widget.forYouModel.user?.avatar ?? "",
        ),
      ],
    );
  }

  List<Widget> _optionsList(List<Options> options) {
    List<Widget> _options = [];
    final _correctOption = widget.forYouModel.correctAnswer?.correctOptions;
    widget.forYouModel.options?.forEach(
      (element) {
        Color color = AppColors.white.withOpacity(0.2);
        bool thisIsCorrect = false;
        bool thisIsWrong = false;
        if (selectedId.isNotEmpty && (_correctOption?.isNotEmpty ?? false)) {
          if (_correctOption?.map((e) => e.id).contains(element.id) ?? false) {
            thisIsCorrect = true;
            color = AppColors.emerald;
          }
          if (selectedId == element.id) {
            if (!(_correctOption?.map((e) => e.id).contains(selectedId) ??
                true)) {
              thisIsWrong = true;
              color = AppColors.roman;
            }
          }
        }
        _options.add(
          InkWell(
            onTap: () {
              setState(() {
                selectedId = element.id ?? "";
              });
            },
            child: Container(
              width: Utils.screenWidth * 0.7,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 20,
                    child: CustomText.sfProRounded(
                      element.answer ?? "",
                      fontWeight: FontWeight.w400,
                      size: 17.sp,
                      color: AppColors.white,
                    ),
                  ),
                  const Spacer(),
                  if (thisIsCorrect) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.check,
                        color: AppColors.emerald,
                        size: 14.sp,
                      ),
                    ),
                  ] else if (thisIsWrong) ...[
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.close,
                        color: AppColors.emerald,
                        size: 14.sp,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        );
        _options.add(const Spacer());
      },
    );
    return _options;
  }
}
