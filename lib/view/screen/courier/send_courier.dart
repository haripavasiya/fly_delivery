import 'package:flutter/material.dart';
import 'package:fly_delivery/utill/app_constants.dart';
import 'package:fly_delivery/view/baseview/app_bar.dart';

import '../../../utill/color_resources.dart';

class SendCourierScreen extends StatefulWidget {
  const SendCourierScreen({Key? key}) : super(key: key);

  @override
  State<SendCourierScreen> createState() => _SendCourierScreenState();
}

class _SendCourierScreenState extends State<SendCourierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: TitleView('Send Courier'),
          preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
        child: const Column(
          children: [

          ],
        ),
      ),
    );
  }
}
