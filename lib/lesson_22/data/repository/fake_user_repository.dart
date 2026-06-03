import 'package:flutter_lab/lesson_22/data/repository/entity/user_entity.dart';

class FakeUserRepository {
  Future<UserEntity> getUserProfile(bool shouldFail) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (shouldFail) {
      throw Exception('Server is temporarily unavailable');
    }
    return UserEntity(id: '1', name: 'Test User');
  }
}
