import 'package:flutter/material.dart';
import 'package:tasks/core/constants/colors.dart';
import 'package:tasks/core/style/text_style.dart';
import '../../view_model/cubit/vc_states.dart';

class ConnectingScreen extends StatelessWidget {
  final VideoCallConnecting state;
  const ConnectingScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: Colors.white),
            const SizedBox(height: 24),
            Text(
              state.message,
              style: bodyStyle(
                color: AppColors.white,
              ),            ),
            const SizedBox(height: 8),
            Text(
              'User: ${state.userId}',
              style: bodyStyle(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
