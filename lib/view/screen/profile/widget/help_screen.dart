import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_delivery/view/baseview/app_bar.dart';
import 'package:fly_delivery/view/screen/dashboard/dashboard_screen.dart';

import '../../../../utill/app_constants.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../../utill/styles.dart';
import '../../../baseview/button/custom_button.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  TextEditingController nameController =TextEditingController();
  TextEditingController subjectController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode subjectFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Help'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02),
        child: Column(
          children: [
            //Name And Email
            Row(
              children: [
                Expanded(child: Container(
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.005,),
                    decoration: BoxDecoration(
                        color: const Color(0xffF6F6F6),
                        borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                    ),
                    child:TextFormField(
                      controller: nameController,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: nameFocus,
                      keyboardType: TextInputType.name,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Name',
                        contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                        errorStyle: const TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )
                ),),
                Expanded(child: Container(
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.005,),
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6),
                      borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                    ),
                    child:TextFormField(
                      controller: emailController,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      focusNode: emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      initialValue: null,
                      textInputAction: TextInputAction.next,
                      style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                      decoration: InputDecoration(
                        hintText: 'Email/Phone',
                        contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                        isDense: true,
                        counterText: '',
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                        hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                        errorStyle: const TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                    )
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemWidth*0.03,),

            //Subject
            Container(
                margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.005,),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                ),
                child:TextFormField(
                  controller: subjectController,
                  maxLines: 8,
                  textAlign: TextAlign.left,
                  focusNode: subjectFocus,
                  keyboardType: TextInputType.text,
                  initialValue: null,
                  textInputAction: TextInputAction.done,
                  style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                  decoration: InputDecoration(
                    hintText: 'Subject...',
                    contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                    isDense: true,
                    counterText: '',
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                    hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                    errorStyle: const TextStyle(height: 1.5),
                    border: InputBorder.none,
                  ),
                )
            ),
            SizedBox(height: AppConstants.itemWidth*0.03,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                  child: Image.asset(Images.ic_notification,width: 20,height: 20,color: ColorResources.COLOR_PRIMERY),
                ),
                SizedBox(width: AppConstants.itemWidth*0.03,),
                Expanded(
                  child: Text("After submit question you will\nnotify very soon.",
                    style: poppinsLight.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.GREY),),
                ),
              ],
            ),
            SizedBox(height: AppConstants.itemWidth*0.1,),

            //Submit Button
            GestureDetector(
                onTap: () {
                  AppConstants.closeKeyboard();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),));
                },
                child: const CustomButton("Submit Question")),
          ],
        ),
      ),
    );
  }
}
