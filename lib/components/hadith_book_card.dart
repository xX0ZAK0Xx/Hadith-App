import 'package:flutter/material.dart';
import 'package:hadith/const/styles.dart';
import 'package:hexagon/hexagon.dart';

class HadithBookCard extends StatelessWidget {
  HadithBookCard({
    super.key, required this.abvr_code, required this.title, required this.title_ar, required this.number_of_hadis, required this.hexagonColor,
  });
  final String abvr_code, title, title_ar, number_of_hadis;
  String? hexagonColor;

  @override
  Widget build(BuildContext context) {
    hexagonColor = hexagonColor?.replaceAll("#", "");
    int hexValue = int.parse(hexagonColor!, radix: 16);
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
                      abvr_code,
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
                      Text(
                        title,
                        style: appStyle(
                            const Color(0xff5D646F), FontWeight.w700, 15),
                      ),
                      Text(
                        title_ar,
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
                number_of_hadis,
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
