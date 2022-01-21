import 'package:flutter/material.dart';
import 'package:up_demo_1/core/resource/colors.dart';
import 'package:up_demo_1/core/themes/app_textstyles.dart';

class TimelineBox extends StatelessWidget {
  final String starting;
  final String ending;
  const TimelineBox({Key? key, required this.ending, required this.starting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Icon(
                  Icons.circle_rounded,
                  color: AppColor.primaryColor,
                ),
                Expanded(
                    child: Divider(
                  thickness: 2,
                  color: AppColor.primaryColor,
                )),
                Icon(
                  Icons.circle_outlined,
                  color: AppColor.primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Start',
                      style: AppTextStyles.boldStyle,
                    ),
                    Text(
                      starting,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'End',
                      style: AppTextStyles.boldStyle,
                    ),
                    Text(
                      ending,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
