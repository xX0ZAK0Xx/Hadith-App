import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith/components/chapter_card.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/navigation_controller.dart';
import 'package:hadith/services/helper.dart';

// ignore: must_be_immutable
class ChaptersPage extends StatelessWidget {
  ChaptersPage({super.key});
  DBHelper dbHelper = DBHelper();
    NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("সব অধ্যায় সমূহ", style: appStyle(Colors.grey.shade700, FontWeight.bold, 20),),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                        navigationController.changePage(2);
                      },
                    child: ChapterCard());
                }),
          )
        ],
      ),
    );
  }
}

