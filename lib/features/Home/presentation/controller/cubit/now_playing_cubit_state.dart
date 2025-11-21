part of 'now_playing_cubit_cubit.dart';

@immutable
sealed class NowPlayingCubitState {}

final class NowPlayingCubitInitial extends NowPlayingCubitState {}

final class NowPlayingCubitIsLoading extends NowPlayingCubitState {}

final class NowPlayingCubitSuccess extends NowPlayingCubitState {
  final MoviesResponse data;

  NowPlayingCubitSuccess({required this.data});
}

final class NowPlayingCubitFailure extends NowPlayingCubitState {}
