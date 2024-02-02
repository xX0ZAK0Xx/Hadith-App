import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith/components/details_card.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/navigation_controller.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});
  NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //------------- AppBar -------------------
        ListTile(
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              navigationController.changePage(1);
            },
          ),
          tileColor: appGreen(),
          title: Text(
            "Sahih Bukhari",
            style: appStylePoppins(Colors.white, FontWeight.w600, 16),
          ),
          subtitle: Text(
            "Revelation",
            style: appStylePoppins(Colors.white, FontWeight.w500, 12),
          ),
        ),
        //----------------- Body ------------------
        Expanded(
          //--------------- green background ----------------
          child: Container(
            width: double.infinity,
            color: appGreen(),
            //-------------- scrollable container ----------------
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: bgColor(),
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return DetailsCard();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
