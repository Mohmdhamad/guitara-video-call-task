import 'package:flutter/material.dart';
import 'package:tasks/features/home/view/widgets/search_bar.dart';
import '../../view_model/cubit/app_states.dart';
import 'recent_calls_list.dart';
import 'favorite_section.dart';

class ContactsList extends StatelessWidget {
  final ContactsLoaded state;

  const ContactsList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBarWidget(),
          const SizedBox(height: 24),
          FavouritesSection(favourites: state.favourites),
          const SizedBox(height: 32),
          RecentCallsSection(recentCalls: state.recentCalls),
        ],
      ),
    );
  }
}
