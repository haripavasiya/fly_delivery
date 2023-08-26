import 'package:flutter/material.dart';
import 'package:fly_delivery/view/screen/courier/courier_screen.dart';
import 'package:fly_delivery/view/screen/courier/send_courier.dart';

import '../../utill/app_constants.dart';
import '../../utill/color_resources.dart';
import '../../utill/images.dart';
import '../../utill/styles.dart';
import '../baseview/app_bar.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: TitleView('Services'),
          preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NearCourierScreen(),)),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03),
                  boxShadow: [
                    BoxShadow(
                        color: ColorResources.BLACK.withOpacity(0.3),
                        blurRadius: 1
                    )
                  ]
              ),
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: AppConstants.itemWidth*0.035),
              margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.ic_near_courier,height: 24,width: 24,),
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                  Expanded(child: Text("Near by Courier",
                      style: poppinsRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth * 0.04))),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SendCourierScreen(),)),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03),
                  boxShadow: [
                    BoxShadow(
                        color: ColorResources.BLACK.withOpacity(0.3),
                        blurRadius: 1
                    )
                  ]
              ),
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: AppConstants.itemWidth*0.035),
              margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.ic_send_courier,height: 24,width: 24,),
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                  Expanded(child: Text("Send Courier",
                      style: poppinsRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth * 0.04))),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorResources.WHITE,
                borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03),
                boxShadow: [
                  BoxShadow(
                      color: ColorResources.BLACK.withOpacity(0.3),
                      blurRadius: 1
                  )
                ]
            ),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: AppConstants.itemWidth*0.035),
            margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.03),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.ic_track_order,height: 24,width: 24,),
                  SizedBox(width: AppConstants.itemWidth*0.03,),
                  Expanded(child: Text("Track Order",
                      style: poppinsRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth * 0.04))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
