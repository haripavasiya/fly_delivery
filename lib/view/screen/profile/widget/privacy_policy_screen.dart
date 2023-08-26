import 'package:flutter/material.dart';
import 'package:fly_delivery/view/baseview/app_bar.dart';

import '../../../../utill/app_constants.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/styles.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  List<String> privacyPolicyList=["What is Lorem Ipsum?","Where does it come from ?","Where can I get some?","Why do we use it?"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Privacy Policy'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
        itemCount: privacyPolicyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.01),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text("${index+1}. ${privacyPolicyList[index]}",
                        textAlign: TextAlign.start,
                        style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK),),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.",
                        textAlign: TextAlign.justify,
                        style: poppinsLight.copyWith(fontSize: AppConstants.itemWidth*0.03,color: ColorResources.BLACK.withOpacity(0.5)),),
                    ),
                  ],
                )
              ],
            ),
          );
        },),
    );
  }
}
