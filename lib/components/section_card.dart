import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/book_controller.dart';
import 'package:hexagon/hexagon.dart';

class SectionCard extends StatelessWidget {
  SectionCard({
    super.key,
    required this.title,
    required this.number,
    required this.index,
  });

  String title, number;
  final int index;

  BookController bookController = Get.put(BookController());
  @override
  Widget build(BuildContext context) {
    if (title.contains("অধ্যায়ঃ")) {
      title = "";
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //------------ Book Icon, Book Name, Author ------------
          Column(
            //----------- 1st 2 items -----------
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HexagonWidget.pointy(
                    width: 45,
                    height: 45,
                    cornerRadius: 10,
                    color: appGreen(),
                    child: Text(
                      index.toString(),
                      style: appStylePoppins(Colors.white, FontWeight.w500, 16),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Text(
                      "$number $title",
                      style:
                          appStyle(const Color(0xff5D646F), FontWeight.w700, 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
