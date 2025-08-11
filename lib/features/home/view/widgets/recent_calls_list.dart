import 'package:flutter/material.dart';
import 'package:tasks/core/style/text_style.dart';
import '../../../video_call_screen/view/screen/video_call_screen.dart';
import '../../../video_call_screen/view_model/cubit/vc_cubit.dart';
import '../../model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentCallsSection extends StatelessWidget {
  final List<UserModel> recentCalls;

  const RecentCallsSection({super.key, required this.recentCalls});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('RECENT TALKS', style: hashStyle()),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentCalls.length,
          itemBuilder: (context, index) {
            final user = recentCalls[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[300],
                    child: Text(
                      user.name[0],
                      style: bodyStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.name, style: bodyStyle()),
                        Text('Last seen recently', style: hashStyle()),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async => await _startVideoCall(context, user),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF0F0F0),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.phone,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () async => await _startVideoCall(context, user),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.videocam,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> _startVideoCall(
    BuildContext context,
    UserModel targetUser,
  ) async {
    await context.read<VideoCallCubit>().startCall(targetUser: targetUser);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VideoCallScreen()),
    );
  }
}
