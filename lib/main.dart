import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/navigation_controller.dart';
import 'package:hadith/pages/details_page.dart';
import 'package:hadith/pages/chapters_page.dart';
import 'package:hadith/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BasePage(),
  ));
}

// ignore: must_be_immutable
class BasePage extends StatelessWidget {
  BasePage({super.key});
  List pages = [
    HomePage(),
    ChaptersPage(),
    DetailsPage(),
  ];
  NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor(),
        // body: Obx(()=>pages[navigationController.currentPage.value],),
        body: PageView(
          onPageChanged: (value) {
            navigationController.currentPage.value = value;
          },
          controller: navigationController.pageController,
          physics: BouncingScrollPhysics(),
          children: [
            HomePage(),
            ChaptersPage(),
            DetailsPage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 60,
              color: Colors.white,
              child: Obx(()=>Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navIcon(context, FontAwesomeIcons.house, 0),
                  navIcon(context, FontAwesomeIcons.bookOpen, 1),
                  navIcon(context, FontAwesomeIcons.book, 2),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  IconButton navIcon(BuildContext context, IconData icon,int page, ) {
    return IconButton(
      icon: Icon(icon, color: page == navigationController.currentPage.value ? appGreen() : appGrey()),
      onPressed: () {
        navigationController.changePage(page);
      },
    );
  }
}
