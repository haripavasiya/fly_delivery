import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class FAQsScreeen extends StatefulWidget {
  const FAQsScreeen({Key? key}) : super(key: key);

  @override
  State<FAQsScreeen> createState() => _FAQsScreeenState();
}

class _FAQsScreeenState extends State<FAQsScreeen> {
  List<String> qustionList=["Why my track is not showing","Tracky insurance terms","How to place order","How to do track","Tracky insurance terms","How to place order"];
  List<String> qustionTempList=[];
  int i=99999;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    qustionTempList.addAll(qustionList);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.WHITE,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
          child: Column(
            children: [

              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Row(
                children: [
                  Expanded(child: Text("FAQ’S",
                      style: poppinsMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth * 0.04))),
                ],
              ),
              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    borderRadius:BorderRadius.circular(AppConstants.itemHeight*0.01),
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Image.asset(Images.ic_search,width: 20,height: 20,),
                      SizedBox(width: AppConstants.itemWidth*0.03,),
                      Expanded(child: TextFormField(
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        initialValue: null,
                        textInputAction: TextInputAction.done,
                        style: poppinsRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                        inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                        onChanged: (value) {
                          setState(() {
                            List<String> results = [];
                            if (value.isEmpty) {
                              results = qustionTempList;
                            } else {
                              results = qustionList
                                  .where((artist) => artist.toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                                  .toList();
                            }
                            qustionList = results;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Tap to search FAQ',
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
              SizedBox(
                height: AppConstants.itemWidth * 0.01,
              ),
              Row(
                children: [
                  Expanded(child: Text("Popular Searched",
                      style: poppinsMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth * 0.04))),
                ],
              ),

              //View
              Expanded(child: ListView.builder(
                itemCount: qustionList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if(i==index){
                          i=99999;
                        }
                        else{
                          i=index;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorResources.WHITE,
                        boxShadow: [
                          BoxShadow(
                            color: ColorResources.BLACK.withOpacity(0.3),
                            blurRadius: 1,
                          )
                        ]
                      ),
                      width: AppConstants.itemWidth,
                      padding: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,vertical: AppConstants.itemHeight*0.01),
                      margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(qustionList[index],
                                  textAlign: TextAlign.start,
                                  style: poppinsRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK),),
                              ),
                              i==index
                                  ?const Icon(Icons.remove,color: ColorResources.BLACK,):const Icon(Icons.add,color: ColorResources.BLACK,)
                            ],
                          ),
                          i==index
                              ?
                          Row(
                            children: [
                              Expanded(
                                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum.",
                                  textAlign: TextAlign.justify,
                                  style: poppinsLight.copyWith(fontSize: AppConstants.itemWidth*0.027,color: ColorResources.BLACK.withOpacity(0.5)),),
                              ),
                            ],
                          )
                              :
                          SizedBox(),
                        ],
                      ),
                    ),
                  );
                },))
            ],
          ),
        ),
      ),
    );
  }
}