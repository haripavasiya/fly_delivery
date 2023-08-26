import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_delivery/utill/color_resources.dart';
import 'package:fly_delivery/utill/images.dart';
import 'package:fly_delivery/view/baseview/app_bar.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/styles.dart';

class NearCourierScreen extends StatefulWidget {
  const NearCourierScreen({Key? key}) : super(key: key);

  @override
  State<NearCourierScreen> createState() => _NearCourierScreenState();
}

class _NearCourierScreenState extends State<NearCourierScreen> {

  String selectCourier="Near me";
  List<String> titleList=["Blue Dart Services","S F Express","Speedy Delivery","Blue Dart Services"];
  List<String> titleTempList=[];
  List<String> statusList=["1","2","1","1"];
  List<String> rateList=["4.0","4.5","3.0","3.5"];

  TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleTempList.addAll(titleList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: TitleView('Near by Courier'),
          preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(
                  vertical: AppConstants.itemHeight * 0.005,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(
                      AppConstants.itemHeight * 0.01),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppConstants.itemWidth * 0.03,
                    ),
                    Image.asset(
                      Images.ic_search,
                      width: 20,
                      height: 20,
                      color: ColorResources.GREY,
                    ),
                    SizedBox(
                      width: AppConstants.itemWidth * 0.03,
                    ),
                    Expanded(
                        child: TextFormField(
                          maxLines: 1,
                          controller: searchController,
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.text,
                          initialValue: null,
                          textInputAction: TextInputAction.done,
                          style: poppinsRegular.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: AppConstants.itemWidth * 0.035),
                          inputFormatters: [
                            FilteringTextInputFormatter.singleLineFormatter
                          ],
                          onChanged: (value) {
                            setState(() {
                              List<String> results = [];
                              if (value.isEmpty) {
                                results = titleTempList;
                              } else {
                                results = titleList
                                    .where((artist) => artist.toString()
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                    .toList();
                              }
                              titleList = results;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Tap to search near by courier',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: AppConstants.itemHeight * 0.02,
                                horizontal: 5),
                            isDense: true,
                            counterText: '',
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintStyle: poppinsRegular.copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: AppConstants.itemWidth * 0.035),
                            errorStyle: const TextStyle(height: 1.5),
                            border: InputBorder.none,
                          ),
                        )),
                    SizedBox(
                      width: AppConstants.itemWidth * 0.03,
                    ),
                  ],
                )),
            Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectCourier="Near me";
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: AppConstants.itemHeight * 0.01,horizontal: AppConstants.itemHeight * 0.01
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: AppConstants.itemHeight * 0.015
                      ),
                      decoration: BoxDecoration(
                        color: selectCourier=="Near me"?ColorResources.COLOR_PRIMERY:Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(
                            AppConstants.itemHeight * 0.01),
                      ),
                      child: Text("Near me",style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: selectCourier=="Near me"?ColorResources.WHITE:ColorResources.BLACK),)),
                ),),
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectCourier="Open now";
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: AppConstants.itemHeight * 0.01,horizontal: AppConstants.itemHeight * 0.01
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: AppConstants.itemHeight * 0.015
                      ),
                      decoration: BoxDecoration(
                        color: selectCourier=="Open now"?ColorResources.COLOR_PRIMERY:Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(
                            AppConstants.itemHeight * 0.01),
                      ),
                      child: Text("Open now",style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: selectCourier=="Open now"?ColorResources.WHITE:ColorResources.BLACK),)),
                ),),
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectCourier="Visited";
                    });
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: AppConstants.itemHeight * 0.01,horizontal: AppConstants.itemHeight * 0.01
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: AppConstants.itemHeight * 0.015
                      ),
                      decoration: BoxDecoration(
                        color: selectCourier=="Visited"?ColorResources.COLOR_PRIMERY:Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(
                            AppConstants.itemHeight * 0.01),
                      ),
                      child: Text("Visited",style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: selectCourier=="Visited"?ColorResources.WHITE:ColorResources.BLACK),)),
                ),),
              ],
            ),
            Expanded(child: ListView.builder(
              itemCount: titleList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.04),
                      boxShadow: [
                        BoxShadow(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          blurRadius: 1,
                        )
                      ]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: AppConstants.itemWidth*0.035),
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(titleList[index],
                                        textAlign: TextAlign.start,
                                        style: poppinsMedium.copyWith(
                                            color: ColorResources.BLACK,
                                            fontSize:
                                            AppConstants.itemWidth * 0.04)),

                                    Text("IND main Rd, USA 3517",
                                        textAlign: TextAlign.start,
                                        style: poppinsLight.copyWith(
                                            color: ColorResources.BLACK
                                                .withOpacity(0.5),
                                            fontSize:
                                            AppConstants.itemWidth * 0.03)),
                                  ])),
                          Text(statusList[index]=="1"?"Open":"Closed",
                              textAlign: TextAlign.start,
                              style: poppinsMedium.copyWith(
                                  color: statusList[index]=="1"?ColorResources.GREEN:ColorResources.RED,
                                  fontSize:
                                  AppConstants.itemWidth * 0.03)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                vertical: AppConstants.itemHeight * 0.01,
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: AppConstants.itemHeight * 0.015,horizontal: AppConstants.itemHeight * 0.015
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemHeight * 0.01),
                              ),
                              child: Text("Open : 9am - 8pm",style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK),)),
                          Row(
                            children: [
                              Icon(Icons.star,color: ColorResources.YELLOW.withOpacity(0.7),size: 18,),
                              Text(rateList[index],
                                  style: poppinsRegular.copyWith(color:ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth*0.03)),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: AppConstants.itemHeight * 0.01,horizontal: AppConstants.itemHeight * 0.005
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppConstants.itemHeight * 0.009,horizontal:  AppConstants.itemHeight * 0.009
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.COLOR_PRIMERY,
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.itemHeight * 0.01),
                                  ),
                                  child: Image.asset(Images.ic_call,color: ColorResources.WHITE,height: AppConstants.itemWidth*0.055,width: AppConstants.itemWidth*0.055,)),
                              Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: AppConstants.itemHeight * 0.01,horizontal: AppConstants.itemHeight * 0.005
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppConstants.itemHeight * 0.009,horizontal:  AppConstants.itemHeight * 0.009
                                  ),
                                  decoration: BoxDecoration(
                                    color: ColorResources.COLOR_PRIMERY,
                                    borderRadius: BorderRadius.circular(
                                        AppConstants.itemHeight * 0.01),
                                  ),
                                  child: Image.asset(Images.ic_map,color: ColorResources.WHITE,height: AppConstants.itemWidth*0.055,width: AppConstants.itemWidth*0.055,)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },)),
          ],
        ),
      ),
    );
  }
}