import 'package:flutter/material.dart';
import 'package:up_demo_1/core/resource/colors.dart';
import 'package:up_demo_1/core/themes/app_textstyles.dart';

class DetailsBox extends StatefulWidget {
  final Image image;
  final String title;

  ///It can be an `ENUM`
  final String status;

  ///It can be a `DateTime`
  final String created;

  final bool isJoined;

  final List<String> tabs;
  const DetailsBox(
      {Key? key,
      required this.image,
      required this.title,
      required this.status,
      required this.created,
      required this.isJoined,
      required this.tabs})
      : super(key: key);

  @override
  _DetailsBoxState createState() => _DetailsBoxState();
}

class _DetailsBoxState extends State<DetailsBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                height: 30,
                child: widget.image,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.productLogoBg,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyles.boldStyle,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        widget.status,
                        style: const TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    widget.created,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColor.primaryColor, width: 1.5),
                ),
                child: Text(
                  'Join',
                  style: AppTextStyles.boldStyle.copyWith(color: AppColor.primaryColor),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 30,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.tabs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4), color: AppColor.bgColor),
                    child: Center(
                        child: Text(
                      widget.tabs[index],
                      style: AppTextStyles.boldStyle,
                    )),
                  );
                }),
          )
        ],
      ),
    );
  }
}
