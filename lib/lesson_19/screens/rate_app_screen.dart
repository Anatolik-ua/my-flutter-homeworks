import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab/lesson_19/bloc/rate_app_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/star-smile.svg',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            const Text(
              'Rating submitted successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(width: 12),
            SvgPicture.asset(
              'assets/images/star-smile.svg',
              width: 21,
              height: 20,
            ),
          ],
        ),
        backgroundColor: const Color(0xFF41A6F4),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RateAppCubit, RateAppState>(
      listener: (context, state) {
        if (state.status == RateAppStatus.success) {
          context.pop();
          _showSuccessSnackBar(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFA5E0FF),
          appBar: AppBar(
            title: const Text(
              'Flutter lab',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
            backgroundColor: const Color(0xFF1B3D70),
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 48),
                Padding(
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 32.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF72C1FA),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _RateTitle(
                          isSuccess: state.status == RateAppStatus.success,
                        ),
                        const SizedBox(height: 16),
                        _StarsRatingBar(state: state),
                        const SizedBox(height: 24),
                        _RateActionButtons(state: state),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RateTitle extends StatelessWidget {
  const _RateTitle({required this.isSuccess});
  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Text(
      isSuccess ? 'You rated the app' : 'How would you rate our app?',
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1B3D70),
      ),
    );
  }
}

class _StarsRatingBar extends StatelessWidget {
  const _StarsRatingBar({required this.state});
  final RateAppState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RateAppCubit>();
    final isLoading = state.status == RateAppStatus.loading;
    final isSuccess = state.status == RateAppStatus.success;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starValue = index + 1;
        final isSelected = starValue <= state.rating;

        return IgnorePointer(
          ignoring: isLoading || isSuccess,
          child: IconButton(
            icon: Icon(
              isSelected ? Icons.star_rounded : Icons.star_border_rounded,
              size: 40,
            ),
            color: const Color(0xFFFEE2B6),
            onPressed: () => cubit.setRating(starValue),
          ),
        );
      }),
    );
  }
}

class _RateActionButtons extends StatelessWidget {
  const _RateActionButtons({required this.state});
  final RateAppState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RateAppCubit>();
    final isLoading = state.status == RateAppStatus.loading;
    final isSuccess = state.status == RateAppStatus.success;

    if (isSuccess) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 13),
            side: const BorderSide(color: Color(0xFF1B3D70)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color(0xFF1B3D70),
            elevation: 4,
            shadowColor: Colors.black.withValues(alpha: 0.25),
          ),
          onPressed: cubit.resetRating,
          child: const Text(
            'Rate again',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B3D70),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBackgroundColor: const Color(0xFF1B3D70),
              elevation: 4,
              shadowColor: Colors.black.withValues(alpha: 0.25),
            ),
            onPressed: (isLoading || state.rating == 0)
                ? null
                : cubit.submitRating,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Submit rating',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF41A6F4),
              foregroundColor: Colors.white,
              disabledBackgroundColor: const Color(0xFF41A6F4),
              disabledForegroundColor: Colors.white70,
              padding: const EdgeInsets.symmetric(vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
              shadowColor: Colors.black.withValues(alpha: 0.25),
            ),
            onPressed: (isLoading || state.rating == 0)
                ? null
                : cubit.resetRating,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.refresh_rounded, size: 20, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  'Reset rating',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
