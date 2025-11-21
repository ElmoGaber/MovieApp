part of 'cast_cubit.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}

final class CastLoading extends CastState {}

final class CastSuccess extends CastState {
  final MovieCredits cast;

  CastSuccess({required this.cast});
}

final class CastFailure extends CastState {
  final String errorMessage;

  CastFailure({required this.errorMessage});
}
