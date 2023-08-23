import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../baseview/button/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: Scaffold(
        body: Container(
          height: AppConstants.itemHeight,
          width: AppConstants.itemWidth,
          decoration: const BoxDecoration(
              color: ColorResources.WHITE,
              image: DecorationImage(image: AssetImage(Images.bg_auth),fit: BoxFit.fill)
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppConstants.itemWidth*0.2,),
              Image.asset(Images.logo,fit: BoxFit.fill,height: AppConstants.itemWidth*0.5,width: AppConstants.itemWidth*0.5,),
              SizedBox(height: AppConstants.itemWidth*0.4,),

              GestureDetector(
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),)),
                child: const CustomButton("Sign In"),
              ),
              SizedBox(height: AppConstants.itemWidth*0.02,),
              GestureDetector(
                // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),)),
                child: const CustomButton("Sign Up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
