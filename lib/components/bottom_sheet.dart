import 'package:flutter/material.dart';
import 'package:hadith/const/styles.dart';

Future<dynamic> bottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
      context: context,
      builder: (context) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("More Option", style: appStylePoppins(const Color(0xff35414D), FontWeight.w600, 17),),
                    IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.close, size: 25, color: Color(0xff5D646F))),
                  ],
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/plane.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("Go To Main Hadith", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/add.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("Add To Collection", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/copy.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("Bangla Copy", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/copy.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("English Copy", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/copy.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("Arabic Copy", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/add.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("Add Hifz", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/add.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("Add Note", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/share.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("Share", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),

                GestureDetector(
                  onTap: (){},
                  child:  Row(children: [
                    SizedBox(
                      height:20,
                      width:20,
                      child: Image.asset('assets/icons/report.png', height: 20,)),
                    const SizedBox(width: 15),
                    Text("Report", style: appStylePoppins(appGrey(), FontWeight.w500, 18)),
                  ],),
                ),


              ],
            ),
          ));
}
