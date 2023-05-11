import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/globals/api_endpoints.dart';
import 'package:tiktok_clone/managers/api_manager.dart';
import 'package:tiktok_clone/models/correct_answer.dart';
import 'package:tiktok_clone/models/following_model.dart';
import 'package:tiktok_clone/models/for_you_model.dart';
import 'package:tiktok_clone/modules/home/state/home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(super.state);

  Future<void> getFollowing() async {
    state = const HomeLoading();
    try {
      state = const HomeLoading();
      final Response response = await APIManager().get(APIEndpoints.following);
      final data = response.data;
      if (data != null) {
        state = HomeLoaded(followingModel: FollowingModel.fromJson(data));
      } else {
        state = const HomeError('No data found');
      }
    } catch (e) {
      state = HomeError(e.toString());
    }
  }

  Future<void> getForYou() async {
    state = const HomeLoading();
    try {
      state = const HomeLoading();
      final Response response = await APIManager().get(APIEndpoints.forYou);
      final data = response.data;
      if (data != null) {
        final model = ForYouModel.fromJson(data);
        final correct = await getAnswer(model.id);
        model.correctAnswer = correct;
        state = HomeLoaded(forYouModel: model);
      } else {
        state = const HomeError('No data found');
      }
    } catch (e) {
      state = HomeError(e.toString());
    }
  }

  Future<CorrectAnswer?> getAnswer(int? id) async {
    if (id == null) return null;
    try {
      final Response response =
          await APIManager().get(APIEndpoints.revealAnswer(id));
      final data = response.data;
      final correct = CorrectAnswer.fromJson(data);
      return correct;
    } catch (e) {
      rethrow;
    }
  }
}
