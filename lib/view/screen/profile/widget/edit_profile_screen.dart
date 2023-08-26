import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_delivery/view/baseview/app_bar.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utill/app_constants.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/images.dart';
import '../../../../utill/styles.dart';
import '../../../baseview/button/custom_button.dart';
import '../../dashboard/dashboard_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  TextEditingController nameController =TextEditingController();
  TextEditingController phoneController =TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  File imageFile = File("");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text="Paul A. Brouillard";
    phoneController.text="+01 123456789";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Edit Profile'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: AppConstants.itemWidth*0.02,right: AppConstants.itemWidth*0.02,top: AppConstants.itemWidth*0.05),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                imageFile.path==""?ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    height: AppConstants.itemHeight*0.15,
                    imageUrl:"https://cdn-icons-png.flaticon.com/512/3177/3177440.png",
                    errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.1,width: AppConstants.itemHeight*0.15,),
                    progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                    fit: BoxFit.cover,
                    width: AppConstants.itemHeight*0.15,
                  ),
                )
                    :
                ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.file(imageFile,
                    fit: BoxFit.cover,
                    width: AppConstants.itemHeight*0.15,
                    height: AppConstants.itemHeight*0.15,),
                ),

                GestureDetector(
                  onTap: () => getImagePick(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ColorResources.COLOR_PRIMERY,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(AppConstants.itemWidth*0.02),
                    child: Image.asset(Images.ic_camera,height: 25,width: 25,color: ColorResources.WHITE,),
                  ),
                ),
              ],
            ),

            SizedBox(height: AppConstants.itemWidth*0.02,),

            //Name
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
                margin: EdgeInsets.all(AppConstants.itemHeight*0.005),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_profile,width: 20,height: 20,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: nameFocus,
                        keyboardType: TextInputType.text,
                        initialValue: null,
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

            //Phone No
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
                margin: EdgeInsets.all(AppConstants.itemHeight*0.005),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                ),
                child:Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_call,width: 20,height: 20,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        maxLines: 1,
                        maxLength: 10,
                        textAlign: TextAlign.left,
                        focusNode: phoneFocus,
                        keyboardType: TextInputType.number,
                        initialValue: null,
                        textInputAction: TextInputAction.done,
                        style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        onChanged: (value) {
                          if(value.length==10){
                            AppConstants.closeKeyboard();
                          }
                        },
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
                child: const CustomButton("Save Changes")),
          ],
        ),
      ),
    );
  }

  Future getImagePick() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
