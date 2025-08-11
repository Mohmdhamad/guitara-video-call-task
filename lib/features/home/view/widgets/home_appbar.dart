import 'package:flutter/material.dart';
import '../../../../core/style/text_style.dart';

AppBar appBarHome(){
  return AppBar(
    centerTitle: true,
    title: Text(
      'CONTACTS',
      style: titleStyle(),
    ),
    actions: [
      const Icon(Icons.person_add_alt_outlined),
      const SizedBox(width: 20,),
    ],
  );
}