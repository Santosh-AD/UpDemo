import 'package:flutter/material.dart';

///This class is used to provide data to information Grid
class InformationData {
  final String title;
  final String value;
  final IconData icon;
  InformationData({
    required this.title,
    this.value = '-',
    required this.icon,
  });
}
