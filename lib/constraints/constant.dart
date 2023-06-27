import 'package:flutter/material.dart';

Color kPrimaryColor = const Color.fromARGB(0, 187, 141, 197);

const kDefaultPadding = 20.0;

final kBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      offset: const Offset(0, 10),
      blurRadius: 10,
    ),
  ],
);
