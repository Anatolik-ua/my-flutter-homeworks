import 'package:flutter_bloc/flutter_bloc.dart';

enum RateAppStatus { initial, loading, success, error }

class RateAppState {
  const RateAppState({
    required this.status,
    required this.rating,
  });

  factory RateAppState.initial() {
    return const RateAppState(
      status: RateAppStatus.initial,
      rating: 0,
    );
  }
  final RateAppStatus status;
  final int rating;

  RateAppState copyWith({
    RateAppStatus? status,
    int? rating,
  }) {
    return RateAppState(
      status: status ?? this.status,
      rating: rating ?? this.rating,
    );
  }
}

class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit() : super(RateAppState.initial());

  void setRating(int newRating) {
    if (state.status == RateAppStatus.loading) return;
    emit(state.copyWith(rating: newRating));
  }

  void resetRating() {
    if (state.status == RateAppStatus.loading) return;
    emit(RateAppState.initial());
  }

  Future<void> submitRating() async {
    if (state.rating == 0 || state.status == RateAppStatus.loading) return;

    emit(state.copyWith(status: RateAppStatus.loading));

    await Future<void>.delayed(const Duration(seconds: 1));

    emit(state.copyWith(status: RateAppStatus.success));
  }
}
