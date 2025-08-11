// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tasks/features/video_call_screen/view_model/cubit/vc_states.dart';
// import '../../../../core/service/vc_service.dart';
// import '../../../home/model/user_model.dart';
//
//
// class VideoCallCubit extends Cubit<VideoCallState> {
//   final VideoService _videoService;
//   UserModel? _currentUser;
//
//   VideoCallCubit(this._videoService) : super(VideoCallInitial());
//
//   Future<void> startCall({UserModel? targetUser}) async {
//     try {
//       _currentUser = UserModel.generateRandom();
//
//       emit(VideoCallConnecting(
//         userId: _currentUser!.id,
//         message: 'Connecting to Test Room...',
//       ));
//
//       final hasPermissions = await _videoService.requestPermissions();
//       if (!hasPermissions) {
//         throw Exception('Camera and microphone permissions required');
//       }
//
//       await _videoService.createClient(_currentUser!);
//       final call = await _videoService.joinTestRoom();
//
//       emit(VideoCallConnected(
//         call: call,
//         userId: _currentUser!.id,
//         participantCount: 1,
//       ));
//
//     } catch (e) {
//       emit(VideoCallError(errorMessage: e.toString()));
//     }
//   }
//
//   Future<void> endCall() async {
//     try {
//       await _videoService.leaveCall();
//       emit(VideoCallEnded());
//     } catch (e) {
//       emit(VideoCallError(errorMessage: 'Failed to end call: ${e.toString()}'));
//     }
//   }
//
//   void resetToInitial() {
//     emit(VideoCallInitial());
//   }
//
//   @override
//   Future<void> close() {
//     _videoService.dispose();
//     return super.close();
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/features/video_call_screen/view_model/cubit/vc_states.dart';
import '../../../../core/service/vc_service.dart';
import '../../../home/model/user_model.dart';

class VideoCallCubit extends Cubit<VideoCallState> {
  final VideoService _videoService;
  UserModel? _currentUser;

  VideoCallCubit(this._videoService) : super(VideoCallInitial());

  Future<void> startCall({UserModel? targetUser}) async {
    try {
      _currentUser = targetUser ?? UserModel.generateRandom();
      emit(VideoCallConnecting(
        userId: _currentUser!.id,
        message: 'Connecting to Test Room...',
      ));

      final hasPermissions = await _videoService.requestPermissions();
      if (!hasPermissions) {
        throw Exception('Camera and microphone permissions required');
      }

      await _videoService.createClient(_currentUser!);
      if (!_videoService.isClientInitialized) {
        throw Exception('Client not initialized');
      }

      final call = await _videoService.joinTestRoom();

      emit(VideoCallConnected(
        call: call,
        userId: _currentUser!.id,
        participantCount: 1,
      ));
    } catch (e) {
      emit(VideoCallError(errorMessage: e.toString()));
    }
  }

  Future<void> endCall() async {
    try {
      await _videoService.leaveCall();
      emit(VideoCallEnded());
    } catch (e) {
      emit(VideoCallError(errorMessage: 'Failed to end call: ${e.toString()}'));
    }
  }

  void resetToInitial() {
    emit(VideoCallInitial());
  }

  @override
  Future<void> close() {
    _videoService.dispose();
    return super.close();
  }
}
