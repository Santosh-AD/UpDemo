import 'package:flutter/material.dart';
import 'package:up_demo_1/core/resource/colors.dart';
import 'package:up_demo_1/core/resource/images.dart';
import 'package:up_demo_1/data/model/args/information_data.dart';
import 'package:up_demo_1/presentation/dashboard/description_box.dart';
import 'package:up_demo_1/presentation/dashboard/details_box.dart';
import 'package:up_demo_1/presentation/dashboard/information_grid.dart';
import 'package:up_demo_1/presentation/dashboard/timeline_box.dart';

class DashboardScreen extends StatefulWidget {
  static const route = '/dashboard';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 300,
              child: Image.network(
                "https://images.pexels.com/photos/6316669/pexels-photo-6316669.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                fit: BoxFit.fitWidth,
                key: Key('PosterImg'),
              ),
            ),
            DetailsBox(
              key: Key('DetailsBox'),
              image: Image.asset(Images.ideaPng),
              title: 'Nuts in Armenia',
              status: 'In progress',
              created: 'Public created 02-Sep-2020 12:00 Am',
              isJoined: false,
              tabs: [
                'Information',
                'People',
                'Timeline',
                'Resources',
                'Project',
              ],
            ),
            TimelineBox(key: Key('TimelineBox'), ending: "01-Sep-2020", starting: '09-Sep-2020'),
            InformationGrid(key: Key('InformationGrid'), data: [
              InformationData(
                title: 'Members',
                icon: Icons.group,
                value: '5',
              ),
              InformationData(
                title: 'Activity',
                icon: Icons.bar_chart,
              ),
              InformationData(
                title: 'Score',
                icon: Icons.speed_outlined,
                value: '0',
              ),
              InformationData(
                title: 'Contributors',
                icon: Icons.work_outline,
                value: '0',
              ),
              InformationData(
                title: 'Risk Factors',
                icon: Icons.pie_chart_outline,
                value: '100%',
              ),
              InformationData(
                title: 'Budget',
                icon: Icons.account_balance,
              ),
              InformationData(
                title: 'Resources',
                icon: Icons.monetization_on,
              ),
              InformationData(
                title: 'Posting',
                icon: Icons.forum,
              ),
            ]),
            const DescriptionBox(
                key: Key('DescriptionBox'),
                description:
                    "How different they are from the same types growing in other geolocations. We want to plan producion of new types of nuts in our territory,"),
          ],
        ),
      ),
    );
  }
}
