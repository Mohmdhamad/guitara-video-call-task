import 'package:equatable/equatable.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

abstract class VideoCallState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VideoCallInitial extends VideoCallState {}

class VideoCallConnecting extends VideoCallState {
  final String userId;
  final String message;

  VideoCallConnecting({required this.userId, required this.message});

  @override
  List<Object?> get props => [userId, message];
}

class VideoCallConnected extends VideoCallState {
  final Call call;
  final String userId;
  final int participantCount;

  VideoCallConnected({
    required this.call,
    required this.userId,
    this.participantCount = 1,
  });

  @override
  List<Object?> get props => [call, userId, participantCount];
}

class VideoCallError extends VideoCallState {
  final String errorMessage;

  VideoCallError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class VideoCallEnded extends VideoCallState {
  final String message;

  VideoCallEnded({this.message = 'Call ended'});

  @override
  List<Object?> get props => [message];
}