import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stream_video_flutter/stream_video_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../features/home/model/user_model.dart';

class VideoService {
  static const String _apiKey = 'qhdc9y2f85v8';
  static const String _testRoomId = 'default_1eac9705-5194-41c5-8a96-5ca520507491';
  //put your lap ip
  static const String _serverUrl = 'http://192.168.1.10:3000';

  StreamVideo? _client;
  Call? _currentCall;

  Future<bool> requestPermissions() async {
    final permissions = await [
      Permission.camera,
      Permission.microphone,
    ].request();
    return permissions.values.every((status) => status.isGranted);
  }

  Future<String> _fetchUserToken(String userId) async {
    try {
      final url = Uri.parse('$_serverUrl/get-token?user_id=$userId');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['token'] != null && data['token'].toString().isNotEmpty) {
          return data['token'];
        } else {
          throw Exception('Token not found in response');
        }
      } else {
        throw Exception('Failed to fetch token: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching token: $e');
    }
  }

  Future<StreamVideo> createClient(UserModel user) async {
    try {
      final token = await _fetchUserToken(user.id);

      _client = await StreamVideo.create(
        _apiKey,
        user: User.regular(
          userId: user.id,
          name: user.name,
        ),
        userToken: token,
      );

      await _client!.connect();
      print('StreamVideo client initialized successfully for user: ${user.id}');
      return _client!;
    } catch (e) {
      print('Error creating StreamVideo client: $e');
      throw Exception('Failed to create StreamVideo client: $e');
    }
  }

  Future<Call> joinTestRoom() async {
    if (_client == null) {
      throw Exception('Client not initialized. Call createClient first.');
    }

    try {
      _currentCall = _client!.makeCall(
        callType: StreamCallType.defaultType(),
        id: _testRoomId,
      );

      await _currentCall!.join();
      print('Joined test room successfully: $_testRoomId');
      return _currentCall!;
    } catch (e) {
      print('Error joining test room: $e');
      throw Exception('Failed to join test room: $e');
    }
  }

  Future<void> leaveCall() async {
    try {
      if (_currentCall != null) {
        await _currentCall!.leave();
        _currentCall = null;
        print('Left call successfully');
      }
    } catch (e) {
      print('Error leaving call: $e');
    }
  }

  void dispose() {
    try {
      _currentCall?.leave();
      _client = null;
      print('VideoService disposed');
    } catch (e) {
      print('Error disposing VideoService: $e');
    }
  }

  bool get isClientInitialized => _client != null;
  StreamVideo? get client => _client;
  Call? get currentCall => _currentCall;
}