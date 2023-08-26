import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_delivery/view/services/services_screen.dart';

import '../../../model/order_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
    return Scaffold(
        backgroundColor: ColorResources.TRANSPARENT,
        appBar: AppBar(
          backgroundColor: ColorResources.WHITE,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(AppConstants.itemHeight * 0.1),
              child: CachedNetworkImage(
                height: AppConstants.itemHeight * 0.05,
                fit: BoxFit.cover,
                width: AppConstants.itemHeight * 0.05,
                imageUrl:
                    "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
                errorWidget: (context, url, error) => Image.asset(
                  Images.placeholderImages,
                  height: AppConstants.itemHeight * 0.05,
                  width: AppConstants.itemHeight * 0.05,
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const Center(
                  child: CircularProgressIndicator(
                    color: ColorResources.COLOR_PRIMERY,
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Paul A. Brouillard",
                textAlign: TextAlign.start,
                style: poppinsLight.copyWith(
                    color: ColorResources.BLACK.withOpacity(0.5),
                    fontSize: AppConstants.itemWidth * 0.03)),
            SizedBox(
              height: AppConstants.itemWidth * 0.01,
            ),
            Text("Welcome Back!",
                textAlign: TextAlign.start,
                style: merriweatherBold.copyWith(
                    color: ColorResources.BLACK,
                    fontSize: AppConstants.itemWidth * 0.04))
          ]),
          actions: [
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationScreen(),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  Images.ic_notification,
                  width: 25,
                  height: 25,
                  color: ColorResources.BLACK,
                ),
              ),
            ),
            SizedBox(
              width: AppConstants.itemWidth * 0.03,
            ),
          ],
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppConstants.itemWidth * 0.03),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Text(
                          "Enter your tracking number and see\ndetails about your parcel.",
                          textAlign: TextAlign.start,
                          style: poppinsLight.copyWith(
                              color: ColorResources.BLACK.withOpacity(0.5),
                              fontSize: AppConstants.itemWidth * 0.035))),
                ],
              ),
              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
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
                            ),
                            SizedBox(
                              width: AppConstants.itemWidth * 0.03,
                            ),
                            Expanded(
                                child: TextFormField(
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.text,
                              initialValue: null,
                              enabled: false,
                              textInputAction: TextInputAction.done,
                              style: poppinsRegular.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: AppConstants.itemWidth * 0.035),
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ],
                              decoration: InputDecoration(
                                hintText: 'Shipping number',
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
                  ),
                  SizedBox(
                    width: AppConstants.itemHeight * 0.01,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: AppConstants.itemHeight * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: ColorResources.COLOR_PRIMERY,
                        borderRadius: BorderRadius.circular(
                            AppConstants.itemHeight * 0.01),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: AppConstants.itemHeight * 0.02,
                          horizontal: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: AppConstants.itemWidth * 0.03,
                          ),
                          Image.asset(
                            Images.ic_scan,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: AppConstants.itemWidth * 0.03,
                          ),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text("Your Recent Order",
                          style: poppinsMedium.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: AppConstants.itemWidth * 0.04))),
                  Text("View all",
                      style: poppinsLight.copyWith(
                          color: ColorResources.COLOR_PRIMERY,
                          fontSize: AppConstants.itemWidth * 0.03)),
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: messageUserList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        borderRadius: BorderRadius.circular(
                            AppConstants.itemWidth * 0.03),
                        boxShadow: [
                          BoxShadow(
                              color: ColorResources.BLACK.withOpacity(0.3),
                              blurRadius: 1)
                        ]),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.itemWidth * 0.03,
                        vertical: AppConstants.itemWidth * 0.02),
                    margin: EdgeInsets.symmetric(
                        vertical: AppConstants.itemWidth * 0.02, horizontal: 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text("Tracking Number",
                                      textAlign: TextAlign.start,
                                      style: poppinsLight.copyWith(
                                          color: ColorResources.BLACK
                                              .withOpacity(0.5),
                                          fontSize:
                                              AppConstants.itemWidth * 0.03)),
                                  SizedBox(
                                    height: AppConstants.itemWidth * 0.01,
                                  ),
                                  Text("#${messageUserList[index].tracking_no}",
                                      textAlign: TextAlign.start,
                                      style: poppinsMedium.copyWith(
                                          color: ColorResources.BLACK,
                                          fontSize:
                                              AppConstants.itemWidth * 0.04))
                                ])),
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: AppConstants.itemHeight * 0.005,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: AppConstants.itemHeight * 0.01,
                                  horizontal: AppConstants.itemHeight * 0.01),
                              decoration: BoxDecoration(
                                color: messageUserList[index].status ==
                                        "Completed"
                                    ? ColorResources.GREEN
                                    : const Color(0xff010000).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(
                                    AppConstants.itemHeight * 0.01),
                              ),
                              child: Text(messageUserList[index].status,
                                  style: poppinsLight.copyWith(
                                      color: ColorResources.WHITE,
                                      fontSize: AppConstants.itemWidth * 0.03)),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.circle_outlined,
                              color: ColorResources.COLOR_PRIMERY,
                              size: 18,
                            ),
                            SizedBox(
                              width: AppConstants.itemWidth * 0.03,
                            ),
                            Expanded(
                              child: Text("Amsterdam, Netherlands",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: poppinsRegular.copyWith(
                                      color: ColorResources.BLACK,
                                      fontSize:
                                          AppConstants.itemWidth * 0.035)),
                            ),
                            Text("24 Jun, 16:32",
                                style: poppinsLight.copyWith(
                                    color: ColorResources.GREY,
                                    fontSize: AppConstants.itemWidth * 0.03))
                          ],
                        ),
                        SizedBox(height: AppConstants.itemWidth * 0.01),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: ColorResources.COLOR_PRIMERY,
                              size: 18,
                            ),
                            SizedBox(
                              width: AppConstants.itemWidth * 0.03,
                            ),
                            Expanded(
                              child: Text("New York, USA",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: poppinsRegular.copyWith(
                                      color: ColorResources.BLACK,
                                      fontSize:
                                          AppConstants.itemWidth * 0.035)),
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
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: const Icon(
            Icons.add,
            color: ColorResources.WHITE,
          ),
          backgroundColor: ColorResources.COLOR_PRIMERY,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ServicesScreen(),
              )),
        ));
  }
}
