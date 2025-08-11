import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/style/text_style.dart';
import 'package:tasks/features/home/model/user_model.dart';
import 'package:tasks/features/video_call_screen/view/screen/video_call_screen.dart';
import 'package:tasks/features/video_call_screen/view_model/cubit/vc_cubit.dart';
import '../../../../core/constants/colors.dart';

class FavouritesSection extends StatelessWidget {
  final List<UserModel> favourites;

  const FavouritesSection({super.key, required this.favourites});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAVOURITE',
          style: hashStyle(),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favourites.length,
            itemBuilder: (context, index) {
              final user = favourites[index];
              return GestureDetector(
                onTap: () async {
                  await context.read<VideoCallCubit>().startCall(targetUser: user);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VideoCallScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.grey[300],
                            child: Text(
                              user.name[0],
                              style:titleStyle(
                                  color: Colors.black54
                              ),
                            ),
                          ),
                          if (user.isOnline)
                            Positioned(
                              bottom: 2,
                              right: 2,
                              child: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}