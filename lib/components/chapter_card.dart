import 'package:flutter/material.dart';
import 'package:hadith/const/styles.dart';
import 'package:hexagon/hexagon.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                      "B",
                      style: appStylePoppins(
                          Colors.white, FontWeight.w500, 16),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ওহীর সূচনা অধ্যায়",
                        style: appStyle(
                            const Color(0xff5D646F),
                            FontWeight.w700,
                            15),
                      ),
                      Text(
                        "সহিহ বুখারী",
                        style: appStyle(
                            const Color(0xff353535)
                                .withOpacity(0.5),
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
                "৭",
                style: appStyle(
                  const Color(0xff5D646F),
                  FontWeight.w700,
                  15),
              ),
              Text(
                "হাদিস",
                style: appStyle(
                const Color(0xff353535)
                    .withOpacity(0.5),
                FontWeight.w400,
                14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
