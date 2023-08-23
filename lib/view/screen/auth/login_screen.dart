import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_delivery/view/screen/auth/registration_screen.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String otp='';
  TextEditingController mono_Controller =TextEditingController();
  TextEditingController password_Controller =TextEditingController();
  final FocusNode mono_Focus = FocusNode();
  final FocusNode password_Focus = FocusNode();
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
              //mobile
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone Number",
                      textAlign: TextAlign.start,
                      style: montserratMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemHeight*0.017)),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
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
                        style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        decoration: InputDecoration(
                          hintText: 'Enter your number',
                          contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
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
                      style: montserratMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemHeight*0.017)),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
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
                        style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                    ],
                  )
              ),
              SizedBox(height: AppConstants.itemHeight*0.005,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?",
                      textAlign: TextAlign.end,
                      style: montserratMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemHeight*0.015)),
                ],
              ),
              SizedBox(height: AppConstants.itemHeight*0.05,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child:  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "By signing you agree to our ",
                          style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.028,color: ColorResources.BLACK)),

                      TextSpan(
                        text: "Privacy Policy",
                        style: montserratMedium.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.COLOR_PRIMERY),
                      ),

                      TextSpan(
                        text: " and ",
                        style: montserratRegular.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.BLACK),),

                      TextSpan(
                        text: "Terms of use",
                        style: montserratMedium.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.COLOR_PRIMERY),
                      ),
                    ]),
                  ),),
                ],
              ),
              SizedBox(height: AppConstants.itemHeight*0.02,),

              //Submit Button
              GestureDetector(
                  onTap: () {
                    AppConstants.closeKeyboard();
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen(),));
                  },
                  child: const CustomButton("Sign In")),
              SizedBox(height: AppConstants.itemHeight*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(thickness: 1,)),
                  Text("Sign Up With",style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.BLACK),),
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
                  Text("Don’t have an account? ",style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.BLACK),),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const RegistrationScreen()));
                      },
                      child: Text("Sign Up",style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.COLOR_PRIMERY),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
