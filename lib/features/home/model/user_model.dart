import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String? avatar;
  final bool isOnline;

  const UserModel({
    required this.id,
    required this.name,
    this.avatar,
    this.isOnline = false,
  });

  static UserModel generateRandom() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final userId = 'user${timestamp % 999 + 1}';
    return UserModel(id: userId, name: 'User $userId');
  }

  @override
  List<Object?> get props => [id, name, avatar, isOnline];
}
