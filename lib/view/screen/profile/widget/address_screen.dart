import 'package:flutter/material.dart';
import 'package:fly_delivery/utill/images.dart';
import 'package:fly_delivery/view/baseview/app_bar.dart';

import '../../../../utill/app_constants.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/styles.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<String> addressList = [
    "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
    "Las Vegas Boulevard 502 , Las Vegas , North Island USA -588187",
    "A-504, Downtown Las Vegas, Las Vegas, Las Vegas, NV, USA -588187",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: TitleView('Address'),
          preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: addressList.isNotEmpty
          ?
      ListView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.itemWidth * 0.03),
        itemCount: addressList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppConstants.itemWidth * 0.01),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Address ${index + 1}",
                        textAlign: TextAlign.start,
                        style: poppinsRegular.copyWith(
                            fontSize: AppConstants.itemWidth * 0.035,
                            color: ColorResources.BLACK),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: ColorResources.COLOR_PRIMERY,
                          size: 20,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            addressList.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.delete_forever,
                          color: ColorResources.COLOR_PRIMERY,
                          size: 20,
                        ))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius:
                          BorderRadius.circular(AppConstants.itemWidth * 0.02),
                      boxShadow: [
                        BoxShadow(
                            color: ColorResources.BLACK.withOpacity(0.2),
                            blurRadius: 1)
                      ]),
                  padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03,horizontal: AppConstants.itemWidth*0.02),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Image.asset(Images.ic_location,width: 25,height: 25),
                      ),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Expanded(
                        child: Text(
                          addressList[index],
                          textAlign: TextAlign.left,
                          style: poppinsRegular.copyWith(
                              fontSize: AppConstants.itemWidth * 0.035,
                              color: ColorResources.BLACK),
                        ),
                      ),
                      SizedBox(width: AppConstants.itemWidth*0.06,),
                    ],
                  ),
                )
              ],
            ),
          );
        },
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
                child: Image.asset(Images.ic_location,width: AppConstants.itemWidth*0.25,height: AppConstants.itemWidth*0.25),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Opps, no address yet!",
                style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: Color(0xffA7A9B7)),),
            ],
          ),
        ],
      ),
    );
  }
}
