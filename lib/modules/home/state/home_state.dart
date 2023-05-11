import 'package:tiktok_clone/models/following_model.dart';
import 'package:tiktok_clone/models/for_you_model.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final FollowingModel? followingModel;
  final ForYouModel? forYouModel;
  const HomeLoaded({this.followingModel, this.forYouModel});
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);
}
