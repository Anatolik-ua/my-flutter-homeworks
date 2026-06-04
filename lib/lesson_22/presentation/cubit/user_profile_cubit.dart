import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/lesson_22/data/repository/entity/app_errors.dart';
import 'package:flutter_lab/lesson_22/data/repository/fake_user_repository.dart';
import 'package:flutter_lab/lesson_22/presentation/cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.repository) : super(UserProfileLoading());

  final FakeUserRepository repository;

  Future<void> loadUserProfile({bool shouldFail = true}) async {
    emit(UserProfileLoading());

    try {
      final user = await repository.getUserProfile(shouldFail);
      emit(UserProfileLoaded(user));
    } on CustomServerError catch (e) {
      emit(UserProfileError(message: 'Помилка сервера: ${e.message}'));
    } catch (e) {
      emit(UserProfileError(message: 'Невідома помилка: $e'));
    }
  }
}
