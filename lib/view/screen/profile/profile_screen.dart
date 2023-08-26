import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fly_delivery/utill/color_resources.dart';
import 'package:fly_delivery/view/screen/notification/notification_screen.dart';
import 'package:fly_delivery/view/screen/profile/widget/address_screen.dart';
import 'package:fly_delivery/view/screen/profile/widget/change_password_screen.dart';
import 'package:fly_delivery/view/screen/profile/widget/edit_profile_screen.dart';
import 'package:fly_delivery/view/screen/profile/widget/help_screen.dart';
import 'package:fly_delivery/view/screen/profile/widget/privacy_policy_screen.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/confirm_dialog_view.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.COLOR_PRIMERY,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Column(
                children: [
                  SizedBox(
                    height: AppConstants.itemWidth * 0.1,
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("Profile",
                          style: poppinsMedium.copyWith(
                              color: ColorResources.WHITE,
                              fontSize: AppConstants.itemWidth * 0.04))),
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.itemWidth * 0.05,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppConstants.itemHeight*0.1),
                          child: CachedNetworkImage(
                            height: AppConstants.itemHeight*0.06,
                            fit: BoxFit.cover,
                            width: AppConstants.itemHeight*0.06,
                            imageUrl:"https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg",
                            errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.05,width: AppConstants.itemHeight*0.05,),
                            progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                          ),
                        ),
                      ),
                      Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Paul A. Brouillard",
                                textAlign: TextAlign.start,
                                style: poppinsLight.copyWith(
                                    color: ColorResources.WHITE,
                                    fontSize: AppConstants.itemWidth * 0.03)),
                            SizedBox(
                              height: AppConstants.itemWidth * 0.01,
                            ),
                            Text("Welcome Back!",
                                textAlign: TextAlign.start,
                                style: merriweatherBold.copyWith(
                                    color:
                                    ColorResources.WHITE,
                                    fontSize:
                                    AppConstants.itemWidth * 0.04))
                          ]
                      ))
                    ],
                  ),
                  SizedBox(
                    height: AppConstants.itemWidth * 0.05,
                  ),
                ],
              ),
            ),
            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical:AppConstants.itemWidth*0.03),
              decoration: BoxDecoration(
                color: ColorResources.WHITE,
                borderRadius:BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.05),topRight: Radius.circular(AppConstants.itemWidth*0.05)),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Image.asset(Images.ic_profile,height: 24,width: 24,),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: Text("Edit Profile",
                            style: poppinsRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Icon(Icons.arrow_forward_ios_sharp,size: 18,color: ColorResources.BLACK.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height: 30,color: ColorResources.GREY.withOpacity(0.2),),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Image.asset(Images.ic_password,height: 24,width: 24,),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: Text("Change Password",
                            style: poppinsRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Icon(Icons.arrow_forward_ios_sharp,size: 18,color: ColorResources.BLACK.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height: 30,color: ColorResources.GREY.withOpacity(0.2),),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressScreen(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Image.asset(Images.ic_location,height: 24,width: 24,),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: Text("Address",
                            style: poppinsRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Icon(Icons.arrow_forward_ios_sharp,size: 18,color: ColorResources.BLACK.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height: 30,color: ColorResources.GREY.withOpacity(0.2),),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Image.asset(Images.ic_notifications,height: 24,width: 24,),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: Text("Notification",
                            style: poppinsRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Icon(Icons.arrow_forward_ios_sharp,size: 18,color: ColorResources.BLACK.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height: 30,color: ColorResources.GREY.withOpacity(0.2),),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Image.asset(Images.ic_help,height: 24,width: 24,),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: Text("Help",
                            style: poppinsRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Icon(Icons.arrow_forward_ios_sharp,size: 18,color: ColorResources.BLACK.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height: 30,color: ColorResources.GREY.withOpacity(0.2),),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(),)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Image.asset(Images.ic_privacy_policy,height: 24,width: 24,),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: Text("Privacy Policy",
                            style: poppinsRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Icon(Icons.arrow_forward_ios_sharp,size: 18,color: ColorResources.BLACK.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height: 30,color: ColorResources.GREY.withOpacity(0.2),),
                  GestureDetector(
                    onTap: () =>_onWillPop(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Image.asset(Images.ic_logout,height: 24,width: 24,),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Expanded(child: Text("Logout",
                            style: poppinsRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth * 0.04))),
                        SizedBox(width: AppConstants.itemWidth*0.03,),
                        Icon(Icons.arrow_forward_ios_sharp,size: 18,color: ColorResources.BLACK.withOpacity(0.5),)
                      ],
                    ),
                  ),
                  Divider(thickness: 1,height: 30,color: ColorResources.GREY.withOpacity(0.2),),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialogView(
              description: "Do you really want to sign out?",
              leftButtonText: "No",
              rightButtonText: "Yes",
              onAgreeTap: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
              });
        }).then((value) => value ?? false);
  }
}
