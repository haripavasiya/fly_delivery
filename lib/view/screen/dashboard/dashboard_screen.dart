import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:fly_delivery/utill/color_resources.dart';

import '../faq_s/faq_s_screen.dart';
import '../home/home_screen.dart';
import '../order/order_screen.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  List<Widget> screenList=[];

  @override
  void initState() {
    super.initState();
    screenList=[
      const HomeScreen(),
      const OrderScreen(),
      const FAQsScreeen(),
      const ProfileScreen(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: screenList[currentPage],
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: 0,
        key: bottomNavigationKey,
        circleColor: ColorResources.COLOR_PRIMERY,
        inactiveIconColor: ColorResources.GREY,
        barBackgroundColor: ColorResources.WHITE,
        tabs: [
          TabData(iconData: Icons.home, title: "", onclick: () {}),
          TabData(iconData: Icons.timer_outlined, title: "", onclick: () {}),
          TabData(
              iconData: Icons.error, title: "", onclick: () {}),
          TabData(iconData: Icons.person, title: "", onclick: () {}),
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}
