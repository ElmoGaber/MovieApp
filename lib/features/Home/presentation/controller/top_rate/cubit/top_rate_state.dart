part of 'top_rate_cubit.dart';

@immutable
sealed class TopRateState {}

final class TopRateInitial extends TopRateState {}

final class TopRateLoading extends TopRateState {}

final class TopRateSuccess extends TopRateState {
  final MoviesResponse data;

  TopRateSuccess({required this.data});
}

final class TopRateFailure extends TopRateState {
  final String message;

  TopRateFailure({required this.message});
}
