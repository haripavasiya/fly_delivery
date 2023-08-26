import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_delivery/view/baseview/app_bar.dart';

import '../../../../utill/app_constants.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../../utill/styles.dart';
import '../../../baseview/button/custom_button.dart';
import '../../dashboard/dashboard_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  TextEditingController currentController =TextEditingController();
  TextEditingController newController =TextEditingController();
  TextEditingController confirmController =TextEditingController();
  final FocusNode currentFocus = FocusNode();
  final FocusNode newFocus = FocusNode();
  final FocusNode confirmFocus = FocusNode();
  late bool passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible=true;
    currentController.text="1234567890";
    newController.text="1234567890";
    confirmController.text="1234567890";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Change Password'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: AppConstants.itemWidth*0.02,right: AppConstants.itemWidth*0.02,top: AppConstants.itemWidth*0.1),
        child: Column(
          children: [
            //Current Password
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Current Password",
                    textAlign: TextAlign.start,
                    style: poppinsMedium.copyWith(
                        color: ColorResources.BLACK,
                        fontSize: AppConstants.itemHeight*0.017)),
              ],
            ),
            Container(
                margin: EdgeInsets.all(AppConstants.itemHeight*0.005),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_password,width: 20,height: 20,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(
                      child: TextFormField(
                        controller: currentController,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: currentFocus,
                        keyboardType: TextInputType.text,
                        initialValue: null,
                        obscureText: passwordVisible,
                        textInputAction: TextInputAction.next,
                        style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                        child: Icon(passwordVisible ? Icons.visibility
                            : Icons.visibility_off,color: ColorResources.GREY,)),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot password !",
                  style: poppinsLight.copyWith(fontSize: AppConstants.itemWidth*0.03,color: ColorResources.GREY),),
              ],
            ),
            SizedBox(height: AppConstants.itemWidth*0.03,),

            //New Password
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New Password",
                    textAlign: TextAlign.start,
                    style: poppinsMedium.copyWith(
                        color: ColorResources.BLACK,
                        fontSize: AppConstants.itemHeight*0.017)),
              ],
            ),
            Container(
                margin: EdgeInsets.all(AppConstants.itemHeight*0.005),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_password,width: 20,height: 20,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(
                      child: TextFormField(
                        controller: newController,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: newFocus,
                        keyboardType: TextInputType.text,
                        initialValue: null,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemWidth*0.03,),

            //Confirm Password
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Confirm Password",
                    textAlign: TextAlign.start,
                    style: poppinsMedium.copyWith(
                        color: ColorResources.BLACK,
                        fontSize: AppConstants.itemHeight*0.017)),
              ],
            ),
            Container(
                margin: EdgeInsets.all(AppConstants.itemHeight*0.005),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_password,width: 20,height: 20,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(
                      child: TextFormField(
                        controller: confirmController,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: confirmFocus,
                        keyboardType: TextInputType.text,
                        initialValue: null,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                        decoration: InputDecoration(
                          hintText: '',
                          contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                )
            ),
            SizedBox(height: AppConstants.itemWidth*0.03,),

            //Submit Button
            GestureDetector(
                onTap: () {
                  AppConstants.closeKeyboard();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
                },
                child: const CustomButton("Change password")),
          ],
        ),
      ),
    );
  }
}
