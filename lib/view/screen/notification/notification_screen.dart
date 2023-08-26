import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> notificationList=["Kathryn Sent You a Message","Your Shipping Already Delivered","Try The Latest Service From Tracky!","Get 20% Discount for First Transaction!"];
  List<String> iconList=[Images.ic_message,Images.ic_shipping,Images.ic_message,Images.ic_discount];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Notification'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: notificationList.length!=0
          ?
      Column(
        children: [
          Row(
            children: [
              SizedBox(width: AppConstants.itemWidth*0.03+5,),
              Expanded(
                child: Text("Recent",
                  style: poppinsMedium.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.04),),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    notificationList=[];
                  });
                },
                child: Text("Clear All",
                  style: poppinsMedium.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.035),),
              ),
              SizedBox(width: AppConstants.itemWidth*0.03,),
            ],
          ),
          SizedBox(height: AppConstants.itemWidth*0.02,),
          Expanded(child:
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: notificationList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,vertical: AppConstants.itemHeight*0.01),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5,bottom: 5),
                          child: Image.asset(iconList[index],width: 25,height: 25),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(notificationList[index],
                                    style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK),),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text("Tap to see the message",
                                    style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.COLOR_PRIMERY),),
                                ),
                              ],
                            ),
                          ],
                        ),),
                        Text('13 min ago',
                          style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.025,color: Color(0xffA7A9B7)),)
                      ],
                    ),
                    Divider(thickness: 1,)
                  ],
                ),
              );
            },))
        ],
      )
          :
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5,bottom: 5),
                child: Image.asset(Images.ic_bell,width: AppConstants.itemWidth*0.25,height: AppConstants.itemWidth*0.25),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Opps, no notification yet!",
                style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: Color(0xffA7A9B7)),),
            ],
          ),
        ],
      ),
    );
  }
}