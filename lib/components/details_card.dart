import 'package:flutter/material.dart';
import 'package:hadith/components/bottom_sheet.dart';
import 'package:hadith/const/styles.dart';
import 'package:hexagon/hexagon.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                          text: '1/1 Chapter: ',
                          style: appStyleInter(
                              appGreen(), FontWeight.w600, 16),
                        ),
                        TextSpan(
                            text:
                                'How the Divine Revelation started being revealed to Allah\'s Messenger',
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
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
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
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(
                                  "Hadith No: ",
                                  style: appStyleLato(const Color(0xff5D646F),
                                      FontWeight.w700, 15),
                                ),
                                Text(
                                  "01",
                                  style: appStyleLato(appGreen(),
                                      FontWeight.w700, 15),
                                ),
                              ]),
                              Text(
                                "Book Name",
                                style: appStyleInter(
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

                  //----------- Category, three dots ---------
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: appGreen(),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Sahih",
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor:
                                        const Color(0xff353535).withOpacity(0.3),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor:
                                        const Color(0xff353535).withOpacity(0.3),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor:
                                        const Color(0xff353535).withOpacity(0.3),
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
                "عَنْ أَبِي هُرَيْرَةَ - رضي الله عنه - قَالَ: قَالَ رَسُولُ اللَّهِ - صلى الله عليه وسلم - فِي الْبَحْرِ: «هُوَ الطَّهُورُ مَاؤُهُ الْحِلُّ مَيْتَتُهُ» أَخْرَجَهُ الْأَرْبَعَةُ، وَابْنُ أَبِي شَيْبَةَ وَاللَّفْظُ لَهُ (1)، وَصَحَّحَهُ ابْنُ خُزَيْمَةَ وَالتِّرْمِذِيُّ",
                textAlign: TextAlign.end,
                style: appStyle(const Color(0xff353535), FontWeight.w400, 22),
              ),
              const SizedBox(
                height: 20,
              ),

              //--------- From -------------
              Text(
                "It is narrated from Abu Hurairah (may Allaah have mercy on him):",
                style:
                    appStyleInter(appGreen(), FontWeight.w600, 16),
              ),
              const SizedBox(
                height: 10,
              ),

              //--------- Description ------------
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                style:
                    appStyleInter(const Color(0xff353535), FontWeight.w400, 16),
              ),
              const SizedBox(
                height: 10,
              ),
              //-------- See also --------------
              Text(
                "(See also 51, 2681, 2804, 2941, 2978, 3174, 4553, 5980, 6260, 7196, 7541) (Modern Publication: 6, Islamic Foundation: 6)",
                style: appStyleInter(const Color(0xff353535).withOpacity(0.5),
                    FontWeight.w400, 14),
              ),
              const SizedBox(
                height: 10,
              ),
              //-------- See also --------------
            ],
          ),
        )
      ],
    );
  }
}
