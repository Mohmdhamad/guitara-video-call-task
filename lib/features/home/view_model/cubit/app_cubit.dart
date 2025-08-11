import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/user_model.dart';
import 'app_states.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit()
    : super(
        ContactsLoaded(
          favourites: _generateFavourites(),
          recentCalls: _generateRecentCalls(),
          currentUser: UserModel.generateRandom(),
        ),
      );

  static List<UserModel> _generateFavourites() {
    return [
      UserModel(id: 'fav1', name: 'Gamal Ali', isOnline: true),
      UserModel(id: 'fav2', name: 'Uomaima Ahmed', isOnline: false),
      UserModel(id: 'fav3', name: 'Islam Hassan', isOnline: true),
      UserModel(id: 'fav4', name: 'Tarek Ibrahim', isOnline: false),
      UserModel(id: 'fav5', name: 'Ahmed Adel', isOnline: true),
      UserModel(id: 'fav6', name: 'Rania Adel', isOnline: false),
      UserModel(id: 'fav7', name: 'Amir Adel', isOnline: true),
    ];
  }

  static List<UserModel> _generateRecentCalls() {
    return [
      UserModel(id: 'rec1', name: 'Stephana J. Terry'),
      UserModel(id: 'rec2', name: 'Doyle J. Acheson'),
      UserModel(id: 'rec3', name: 'Juanita S. Wagner'),
      UserModel(id: 'rec4', name: 'Jaquenetta Freddie'),
      UserModel(id: 'rec5', name: 'Jacqueline Jones'),
    ];
  }

  void refreshContacts() {
    emit(
      ContactsLoaded(
        favourites: _generateFavourites(),
        recentCalls: _generateRecentCalls(),
        currentUser: UserModel.generateRandom(),
      ),
    );
  }
}
