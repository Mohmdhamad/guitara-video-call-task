import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search your contacts',
        hintStyle: const TextStyle(color: AppColors.grey, fontSize: 16),
        prefixIcon: const Icon(Icons.search, color: AppColors.grey),
        suffixIcon: const Icon(Icons.mic, color: AppColors.blue),
        filled: true,
        fillColor: const Color(0xFFF0F0F0),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
