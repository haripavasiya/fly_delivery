import 'package:flutter/material.dart';
import 'package:fly_delivery/utill/color_resources.dart';

import '../../../model/order_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/styles.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  String selectStatus="All";
  List<OrderModel> messageUserList=[];

  @override
  void initState() {
    super.initState();
    messageUserList.add(OrderModel("958 471 2684", "Pending", "Amsterdam, Netherlands", "New York, USA", "24 Jun, 16:32", "30 Jun, 08:41"));
    messageUserList.add(OrderModel("234 586 1234", "Completed", "Amsterdam, Netherlands", "New York, USA", "03 Jun, 16:32", "12 Jun, 08:41"));
    messageUserList.add(OrderModel("345 963 7531", "Pending", "Amsterdam, Netherlands", "New York, USA", "24 Jun, 16:32", "30 Jun, 08:41"));
    messageUserList.add(OrderModel("785 852 1597", "Completed", "Amsterdam, Netherlands", "New York, USA", "03 Jun, 16:32", "11 Jun, 08:41"));
    messageUserList.add(OrderModel("259 741 8956", "Pending", "Amsterdam, Netherlands", "New York, USA", "20 Jun, 16:32", "23 Jun, 08:41"));
    messageUserList.add(OrderModel("534 159 4568", "Pending", "Amsterdam, Netherlands", "New York, USA", "20 Jun, 16:32", "26 Jun, 08:41"));
    messageUserList.add(OrderModel("958 753 1236", "Completed", "Amsterdam, Netherlands", "New York, USA", "13 Jun, 16:32", "18 Jun, 08:41"));
    messageUserList.add(OrderModel("232 364 0236", "Pending", "Amsterdam, Netherlands", "New York, USA", "11 Jun, 16:32", "13 Jun, 08:41"));
    messageUserList.add(OrderModel("135 145 0147", "Pending", "Amsterdam, Netherlands", "New York, USA", "201 Jun, 16:32", "11 Jun, 08:41"));
    messageUserList.add(OrderModel("970 986 0258", "Completed", "Amsterdam, Netherlands", "New York, USA", "01 Jun, 16:32", "05 Jun, 08:41"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.WHITE,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
          child: Column(
            children: [
              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Row(
                children: [
                  Expanded(child: Text("Order History",
                      style: poppinsMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth * 0.04))),
                ],
              ),
              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Row(
                children: [
                  Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectStatus="All";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,),
                        decoration: BoxDecoration(
                          color: selectStatus=="All"?ColorResources.COLOR_PRIMERY:Color(0xffF6F6F6),
                          borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.015, horizontal: 5),
                        child:Text("All",
                            style: poppinsRegular.copyWith(
                                color: selectStatus=="All"?ColorResources.WHITE:ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))
                    ),
                  ),),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectStatus="Completed";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectStatus=="Completed"?ColorResources.COLOR_PRIMERY:Color(0xffF6F6F6),
                          borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                        ),
                        padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.015, horizontal: 5),
                        child:Text("Completed",
                            style: poppinsRegular.copyWith(
                                color: selectStatus=="Completed"?ColorResources.WHITE:ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))
                    ),
                  ),),
                  Expanded(child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectStatus="Pending";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectStatus=="Pending"?ColorResources.COLOR_PRIMERY:Color(0xffF6F6F6),
                          borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                        ),
                        padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.015, horizontal: 5),
                        child:Text("Pending",
                            style: poppinsRegular.copyWith(
                                color: selectStatus=="Pending"?ColorResources.WHITE:ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Expanded(child: ListView.builder(
                itemCount: messageUserList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.03),
                        boxShadow: [
                          BoxShadow(
                              color: ColorResources.BLACK.withOpacity(0.2),
                              blurRadius: 1
                          )
                        ]
                    ),
                    padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: AppConstants.itemWidth*0.02),
                    margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: 3),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Tracking Number",
                                      textAlign: TextAlign.start,
                                      style: poppinsLight.copyWith(
                                          color: ColorResources.BLACK.withOpacity(0.5),
                                          fontSize: AppConstants.itemWidth * 0.03)),
                                  SizedBox(
                                    height: AppConstants.itemWidth * 0.01,
                                  ),
                                  Text("#${messageUserList[index].tracking_no}",
                                      textAlign: TextAlign.start,
                                      style: poppinsMedium.copyWith(
                                          color:
                                          ColorResources.BLACK,
                                          fontSize:
                                          AppConstants.itemWidth * 0.04))
                                ]
                            )),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                              padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01,horizontal: AppConstants.itemHeight*0.01),
                              decoration: BoxDecoration(
                                color: messageUserList[index].status=="Completed"?ColorResources.GREEN:Color(0xff010000).withOpacity(0.3),
                                borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                              ),
                              child: Text(messageUserList[index].status,
                                  style: poppinsLight.copyWith(
                                      color: ColorResources.WHITE,
                                      fontSize: AppConstants.itemWidth * 0.03)),
                            )
                          ],
                        ),
                        Divider(thickness: 1,),
                        Row(
                          children: [
                            Icon(Icons.circle_outlined,color: ColorResources.COLOR_PRIMERY,size: 18,),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                            Expanded(
                              child: Text("Amsterdam, Netherlands",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: poppinsRegular.copyWith(
                                      color: ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth * 0.035)),
                            ),
                            Text("24 Jun, 16:32",
                                style: poppinsLight.copyWith(
                                    color: ColorResources.GREY,
                                    fontSize: AppConstants.itemWidth * 0.03))
                          ],
                        ),
                        SizedBox(height: AppConstants.itemWidth*0.01),
                        Row(
                          children: [
                            Icon(Icons.location_on,color: ColorResources.COLOR_PRIMERY,size: 18,),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                            Expanded(
                              child: Text("New York, USA",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: poppinsRegular.copyWith(
                                      color: ColorResources.BLACK,
                                      fontSize: AppConstants.itemWidth * 0.035)),
                            ),
                            Text("30 Jun, 08:41",
                                style: poppinsLight.copyWith(
                                    color: ColorResources.GREY,
                                    fontSize: AppConstants.itemWidth * 0.03))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
