part of 'review_cubit_cubit.dart';

@immutable
sealed class ReviewCubitState {}

final class ReviewCubitInitial extends ReviewCubitState {}

final class ReviewCubitLoading extends ReviewCubitState {}

final class ReviewCubitSuccess extends ReviewCubitState {
  final MovieReviewsResponse Review_data;

  ReviewCubitSuccess({required this.Review_data});
}

final class ReviewCubitFailure extends ReviewCubitState {
  final String errorMessage;

  ReviewCubitFailure({required this.errorMessage});
}
