import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/enums/home_section.dart';
import 'package:tiktok_clone/modules/home/riverpod/home_notifier.dart';
import 'package:tiktok_clone/modules/home/state/home_state.dart';

final timerProvider = StateProvider<int>((ref) => 0);
final homeScreenCurrentSectionProvider =
    StateProvider<HomeSection>((ref) => HomeSection.following);
final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
    (ref) => HomeNotifier(const HomeInitial()));
