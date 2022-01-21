import 'package:flutter/material.dart';
import 'package:up_demo_1/core/themes/app_textstyles.dart';

class DescriptionBox extends StatelessWidget {
  final String description;
  const DescriptionBox({required this.description, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: AppTextStyles.boldStyle,
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.black54, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
