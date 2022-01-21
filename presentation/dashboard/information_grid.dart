import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:up_demo_1/core/resource/colors.dart';
import 'package:up_demo_1/data/model/args/information_data.dart';

class InformationGrid extends StatelessWidget {
  final List<InformationData> data;
  const InformationGrid({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 1.45),
          itemBuilder: (context, index) {
            return InformationGridItem(data: data[index]);
          }),
    );
  }
}

class InformationGridItem extends StatelessWidget {
  final InformationData data;
  const InformationGridItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          data.icon,
          color: AppColor.primaryColor,
          size: 30,
        ),
        Text(
          data.title,
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        Text(
          data.value,
          style: TextStyle(fontSize: 15, color: Colors.black),
        )
      ],
    );
  }
}
