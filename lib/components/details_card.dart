import 'package:flutter/material.dart';
import 'package:hadith/components/bottom_sheet.dart';
import 'package:hadith/const/styles.dart';
import 'package:hexagon/hexagon.dart';

class DetailsCard extends StatelessWidget {
  DetailsCard(
      {super.key,
      required this.hadiths,
      required this.hexagonColor,
      required this.grade,
      required this.gradeColor,
      required this.bookAbvr,
      required this.bookName,
      required this.hadithId,
      required this.sectionNumber,
      required this.sectionPreface,
      required this.sectionTitle,
      required this.totalHadith, required this.arabic, required this.bangla, required this.footNote, required this.narrator});
  var hadiths;
  String? hexagonColor;
  String? grade,
      sectionNumber,
      sectionTitle,
      sectionPreface,
      bookAbvr,
      bookName,
      gradeColor, arabic, bangla, narrator, footNote;
  int? hadithId, totalHadith;

  @override
  Widget build(BuildContext context) {
    hexagonColor = hexagonColor?.replaceAll("#", "");
    int hexValue = int.parse(hexagonColor!, radix: 16);

    gradeColor = gradeColor?.replaceAll("#", "");
    int gradeValue = int.parse(gradeColor!, radix: 16);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //-------------- upper card ----------------
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            children: [
              //-------------- uper text --------------
              Row(
                children: [
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.clip,
                      text: TextSpan(children: [
                        TextSpan(
                          text: sectionNumber,
                          style: appStyleInter(appGreen(), FontWeight.w600, 16),
                        ),
                        TextSpan(
                            text: sectionTitle,
                            style: appStylePoppins(
                                const Color(0xff5D646F), FontWeight.w600, 16))
                      ]),
                    ),
                  ),
                ],
              ),
              //---------------- divider ----------------
              const Divider(
                color: Color(0xffEFEFEF),
              ),
              //---------------- lower text ----------------
              Text(
                sectionPreface!,
                style: appStyle(const Color(0xff353535).withOpacity(0.5),
                    FontWeight.w400, 14),
              )
            ],
          ),
        ),

        //---------- Gap -------------
        const SizedBox(
          height: 14,
        ),

        //---------- Lower Card ----------------
        Column(
          children: List.generate(totalHadith!, (index) {
            return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //--------- Information ------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //------------ Book Icon, hadith no. ------------
                          Column(
                            children: [
                              Row(
                                children: [
                                  HexagonWidget.pointy(
                                    width: 45,
                                    height: 45,
                                    cornerRadius: 10,
                                    color: Color(0xFF000000 | hexValue),
                                    child: Text(
                                      bookAbvr!,
                                      style: appStylePoppins(
                                          Colors.white, FontWeight.w500, 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Text(
                                          "Hadith No: ",
                                          style: appStyleLato(
                                              const Color(0xff5D646F),
                                              FontWeight.w700,
                                              15),
                                        ),
                                        Text(
                                          hadiths[index].hadith_id.toString(),
                                          style: appStyleLato(
                                              appGreen(), FontWeight.w700, 15),
                                        ),
                                      ]),
                                      Text(
                                        bookName!,
                                        style: appStyleInter(
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

                          //----------- Category, three dots ---------
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF000000 | gradeValue),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      hadiths[index].grade,
                                      style: appStyleInter(
                                          Colors.white, FontWeight.w500, 14),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      bottomSheet(context);
                                    },
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.transparent,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            radius: 2,
                                            backgroundColor:
                                                const Color(0xff353535)
                                                    .withOpacity(0.3),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          CircleAvatar(
                                            radius: 2,
                                            backgroundColor:
                                                const Color(0xff353535)
                                                    .withOpacity(0.3),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          CircleAvatar(
                                            radius: 2,
                                            backgroundColor:
                                                const Color(0xff353535)
                                                    .withOpacity(0.3),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      //------------- gap ------------
                      const SizedBox(
                        height: 30,
                      ),
                      //--------- Arabic ------------
                      Text(
                        hadiths[index].ar,
                        textAlign: TextAlign.end,
                        style: appStyle(
                            const Color(0xff353535), FontWeight.w400, 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //--------- From -------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.85,
                            child: Text(
                              "${hadiths[index].narrator} থেকে বর্ণিত:",
                              textAlign: TextAlign.left,
                              style: appStyleInter(appGreen(), FontWeight.w600, 16),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //--------- Description ------------
                      Text(
                        hadiths[index].bn,
                        style: appStyleInter(
                            const Color(0xff353535), FontWeight.w400, 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //---------------- divider ----------------
                      const Divider(
                        color: Color(0xffEFEFEF),
                      ),
                      //-------- See also --------------
                      Text(
                        hadiths[index].note,
                        style: appStyleInter(
                            const Color(0xff353535).withOpacity(0.5),
                            FontWeight.w400,
                            14),
                      ),
                    ],
                  ),
                );
          })
        ),
      ],
    );
  }
}
