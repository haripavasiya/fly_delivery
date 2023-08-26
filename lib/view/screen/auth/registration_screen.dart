import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';
import '../otp/otp_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String otp='';
  TextEditingController mono_Controller =TextEditingController();
  TextEditingController name_Controller =TextEditingController();
  TextEditingController password_Controller =TextEditingController();
  final FocusNode mono_Focus = FocusNode();
  final FocusNode password_Focus = FocusNode();
  final FocusNode name_Focus = FocusNode();
  bool isChecked=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otp=Random().nextInt(9999).toString().padLeft(4, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      resizeToAvoidBottomInset: false,
      body: Container(
        height: AppConstants.itemHeight,
        width: AppConstants.itemWidth,
        decoration: const BoxDecoration(
            color: ColorResources.WHITE,
            image: DecorationImage(image: AssetImage(Images.bg_auth),fit: BoxFit.fill)
        ),
        padding: EdgeInsets.only(top: AppConstants.itemWidth*0.1),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04),
          child: Column(
            children: [
              //name
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name",
                      textAlign: TextAlign.start,
                      style: poppinsMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemHeight*0.017)),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius:BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                      ]
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Image.asset(Images.ic_profile,width: 20,height: 20,),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Expanded(child: TextFormField(
                        controller: name_Controller,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: name_Focus,
                        keyboardType: TextInputType.name,
                        initialValue: null,
                        textInputAction: TextInputAction.next,
                        style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                    ],
                  )
              ),
              SizedBox(height: AppConstants.itemHeight*0.02,),

              //mobile
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone Number",
                      textAlign: TextAlign.start,
                      style: poppinsMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemHeight*0.017)),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius:BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                      ]
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Image.asset(Images.ic_call,width: 20,height: 20,),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Expanded(child: TextFormField(
                        controller: mono_Controller,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: mono_Focus,
                        keyboardType: TextInputType.number,
                        initialValue: null,
                        textInputAction: TextInputAction.next,
                        style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          hintText: 'Enter your number',
                          contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                    ],
                  )
              ),
              SizedBox(height: AppConstants.itemHeight*0.02,),

              //password
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password",
                      textAlign: TextAlign.start,
                      style: poppinsMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemHeight*0.017)),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius:BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                      ]
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Image.asset(Images.ic_password,width: 20,height: 20,),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Expanded(child: TextFormField(
                        controller: password_Controller,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: password_Focus,
                        keyboardType: TextInputType.text,
                        initialValue: null,
                        textInputAction: TextInputAction.done,
                        style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                    ],
                  )
              ),
              SizedBox(height: AppConstants.itemHeight*0.005,),

              //Submit Button
              GestureDetector(
                  onTap: () {
                    AppConstants.closeKeyboard();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OTPScreen(),));
                  },
                  child: const CustomButton("Sign up")),
              SizedBox(height: AppConstants.itemHeight*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(thickness: 1,)),
                  Text("Sign Up With",style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.BLACK),),
                  Expanded(child: Divider(thickness: 1,)),
                ],
              ),
              SizedBox(height: AppConstants.itemHeight*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          border: Border.all(width: 1,color: Color(0xffD3D4DB)),
                          borderRadius: BorderRadius.circular(
                              AppConstants.itemWidth * 0.02)),
                      padding: const EdgeInsets.all(7),
                      margin: EdgeInsets.symmetric(
                          horizontal: AppConstants.itemWidth * 0.02),
                      child: Image.asset(Images.ic_facebook,width: 20,height: 20,),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.WHITE,
                          border: Border.all(width: 1,color: Color(0xffD3D4DB)),
                          borderRadius: BorderRadius.circular(
                              AppConstants.itemWidth * 0.02)),
                      padding: const EdgeInsets.all(7),
                      margin: EdgeInsets.symmetric(
                          horizontal: AppConstants.itemWidth * 0.02),
                      child: Image.asset(Images.ic_google,width: 20,height: 20,),
                    ),
                  ),
                ],
              ),

              //Not Account
              SizedBox(height: AppConstants.itemHeight*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ? ",style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.BLACK),),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("Sign in",style: poppinsMedium.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.COLOR_PRIMERY),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
