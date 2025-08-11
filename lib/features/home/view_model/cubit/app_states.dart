import 'package:equatable/equatable.dart';
import '../../model/user_model.dart';

abstract class ContactsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ContactsLoading extends ContactsState {}

class ContactsError extends ContactsState {
  final String message;

  ContactsError(this.message);

  @override
  List<Object?> get props => [message];
}

class ContactsLoaded extends ContactsState {
  final List<UserModel> favourites;
  final List<UserModel> recentCalls;
  final UserModel currentUser;

  ContactsLoaded({
    required this.favourites,
    required this.recentCalls,
    required this.currentUser,
  });

  @override
  List<Object?> get props => [favourites, recentCalls, currentUser];
}
