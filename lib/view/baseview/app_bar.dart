import 'package:flutter/material.dart';

import '../../utill/app_constants.dart';
import '../../utill/color_resources.dart';
import '../../utill/images.dart';
import '../../utill/styles.dart';

class TitleView extends StatelessWidget {
  String title;
  TitleView(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorResources.WHITE,
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: ColorResources.WHITE),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Image.asset(Images.ic_back_icon,height: 24,width: 24,),
        ),
      ),
      title: Text(title,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: poppinsMedium.copyWith(
              color: ColorResources.BLACK,
              fontSize: AppConstants.itemWidth*0.04)),
    );
  }
}
