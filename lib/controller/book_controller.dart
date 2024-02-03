import 'package:get/get.dart';

class BookController extends GetxController {
  late BookController bookController;

  RxInt currentBookID = 1.obs;
  RxString currentBookAbvr = "B".obs;
  RxString currentBookName = "সহিহ বুখারী".obs;
  RxString currentBookColor = "0xff70bb65".obs;

  RxInt currentChapterID = 1.obs;
  RxInt currentHadithID = 1.obs;

  void changeBook(int book, String abvr, String color, String name) {
    currentBookID.value = book;
    currentBookAbvr.value = abvr;
    currentBookColor.value = color;
    currentBookName.value = name;
  }
}
