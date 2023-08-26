import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_delivery/view/screen/dashboard/dashboard_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../provider/otp_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String verificationCode = '', otp = "";

  @override
  void initState() {
    super.initState();
    Provider.of<OTPProvider>(context, listen: false).setReStart(context);
    Provider.of<OTPProvider>(context, listen: false).startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OTPProvider>(builder: (context, otpProvider, child) {
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
                      Text("Verification Code",
                          textAlign: TextAlign.start,
                          style: poppinsMedium.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: AppConstants.itemHeight*0.025)),
                    ],
                  ),
                  SizedBox(height: AppConstants.itemHeight*0.02,),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "We have sent the code verification to your number ",
                          style: poppinsLight.copyWith(
                              color: Color(0xffA7A9B7),
                              fontSize: AppConstants.itemWidth * 0.04)),

                      TextSpan(
                        text: "+01 1234567489",
                        style:poppinsRegular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: AppConstants.itemWidth * 0.04),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: AppConstants.itemHeight * 0.04,
                  ),
                  PinCodeTextField(
                    length: 4,
                    appContext: context,
                    obscureText: false,
                    showCursor: true,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 45,
                      fieldWidth: 45,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(5),
                      selectedColor: Theme.of(context).primaryColor,
                      selectedFillColor: ColorResources.WHITE,
                      inactiveFillColor: Color(0xffF8F9FB),
                      inactiveColor: Color(0xffF8F9FB),
                      activeColor: Color(0xffF8F9FB),
                      activeFillColor: Color(0xffF8F9FB),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onChanged: (value) => verificationCode = value,
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),

                  SizedBox(
                    height: AppConstants.itemWidth * 0.06,
                  ),

                  Visibility(
                    visible: otpProvider.start == 0 ? false : true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            '00 : ${Provider.of<OTPProvider>(context, listen: false).start}',
                            style: poppinsMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.FONT_SIZE_14)),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: AppConstants.itemWidth * 0.06,
                  ),

                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),)),
                      child: const CustomButton("Submit")),

                  SizedBox(
                    height: AppConstants.itemWidth * 0.06,
                  ),
                  Visibility(
                    visible: otpProvider.start == 0 ? true : false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Didn’t receive the code ? ',
                            style: poppinsLight.copyWith(
                                color: Color(0xffA7A9B7),
                                fontSize: Dimensions.FONT_SIZE_14)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AppConstants.closeKeyboard();
                              otpProvider.setReStart(context);
                              otpProvider.startTimer(context);
                            });
                          },
                          child: Text('Resend',
                              style: poppinsRegular.copyWith(
                                  color: ColorResources.COLOR_PRIMERY,
                                  fontSize: Dimensions.FONT_SIZE_14)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
