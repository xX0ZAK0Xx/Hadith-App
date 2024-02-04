import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/book_controller.dart';
import 'package:hexagon/hexagon.dart';

class ChapterCard extends StatelessWidget {
  ChapterCard({
    super.key, required this.title, required this.range, required this.index,
  });

  final String title, range;
  final int index;

  BookController bookController = Get.put(BookController());
  @override
  Widget build(BuildContext context) {
    String hexagonColor = bookController.currentBookColor.value;
    hexagonColor = hexagonColor.replaceAll("#", "");
    int hexValue = int.parse(hexagonColor, radix: 16);
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
                    color: Color(0xFF000000 | hexValue),
                    child: Text(
                      index.toString(),
                      style: appStylePoppins(Colors.white, FontWeight.w500, 16),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Text(
                          title,
                          style: appStyle(
                              const Color(0xff5D646F), FontWeight.w700, 15),
                        ),
                      ),
                      Text(
                        bookController.currentBookName.value,
                        style: appStyle(
                            const Color(0xff353535).withOpacity(0.5),
                            FontWeight.w400,
                            14),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          //----------- total hadith ---------
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                range,
                style: appStyle(const Color(0xff5D646F), FontWeight.w700, 15),
              ),
              Text(
                "হাদিস",
                style: appStyle(const Color(0xff353535).withOpacity(0.5),
                    FontWeight.w400, 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
