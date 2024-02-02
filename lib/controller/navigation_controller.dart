import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    pageController.dispose();
    super.onClose();
  }

  void changePage(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }
}
