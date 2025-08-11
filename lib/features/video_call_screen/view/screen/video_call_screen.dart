import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:tasks/features/video_call_screen/view/widgets/connecting_widget.dart';
import 'package:tasks/features/video_call_screen/view/widgets/error_widget.dart';
import '../../view_model/cubit/vc_cubit.dart';
import '../../view_model/cubit/vc_states.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<VideoCallCubit, VideoCallState>(
        listener: (context, state) {
          if (state is VideoCallEnded) {
            Navigator.pop(context);
          }
          if (state is VideoCallError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          if (state is VideoCallConnecting) {
            return ConnectingScreen(state: state);
          }
          if (state is VideoCallConnected) {
            return StreamCallContainer(call: state.call);
          }
          if (state is VideoCallError) {
            return ErrorScreen(state: state);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
