import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/style/text_style.dart';
import '../../view_model/cubit/vc_cubit.dart';
import '../../view_model/cubit/vc_states.dart';

class ErrorScreen extends StatelessWidget {
  final VideoCallError state;
  const ErrorScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 64,
              ),
              const SizedBox(height: 24),
               Text(
                'Connection Failed',
                style: titleStyle(
                    color: AppColors.white
                ),
              ),
              const SizedBox(height: 16),
              Text(
                state.errorMessage,
                textAlign: TextAlign.center,
                  style:titleStyle(
                      color: AppColors.white
                  ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<VideoCallCubit>().startCall(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
