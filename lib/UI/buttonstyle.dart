import 'package:flutter/material.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.grey[300],
  minimumSize: Size(70, 50),
  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);