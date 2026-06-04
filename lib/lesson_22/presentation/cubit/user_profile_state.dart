import 'package:flutter_lab/lesson_22/data/repository/entity/user_entity.dart';

sealed class UserProfileState {}

final class UserProfileLoading implements UserProfileState {}

final class UserProfileLoaded implements UserProfileState {
  UserProfileLoaded(this.user);
  final UserEntity user;
}

final class UserProfileError implements UserProfileState {
  UserProfileError({required this.message});
  final String message;
}
