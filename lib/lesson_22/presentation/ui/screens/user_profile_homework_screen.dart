import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/lesson_22/data/repository/entity/user_entity.dart';
import 'package:flutter_lab/lesson_22/presentation/cubit/user_profile_cubit.dart';
import 'package:flutter_lab/lesson_22/presentation/cubit/user_profile_state.dart';

class UserProfileHomeworkScreen extends StatefulWidget {
  const UserProfileHomeworkScreen({super.key});

  @override
  State<UserProfileHomeworkScreen> createState() =>
      _UserProfileHomeworkScreenState();
}

class _UserProfileHomeworkScreenState extends State<UserProfileHomeworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile Homework')),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return switch (state) {
            //Loading State
            UserProfileLoading() => const Center(
              child: CircularProgressIndicator(),
            ),

            //Loaded State
            UserProfileLoaded() => _LoadedProfileWidget(user: state.user),

            //Error State
            // TODO(student): Need implement error state
          };
        },
      ),
    );
  }
}

class _LoadedProfileWidget extends StatelessWidget {
  const _LoadedProfileWidget({required this.user});

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text('ID: ${user.id}'),
                const SizedBox(height: 16),
                const Text(
                  'Профіль успішно завантажено!',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
