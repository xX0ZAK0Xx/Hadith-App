import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class BookController extends GetxController {
  late BookController bookController;

  RxInt currentBookID = 1.obs;
  RxString currentBookAbvr = "B".obs;
  RxString currentBookName = "সহিহ বুখারী".obs;
  RxString currentBookColor = "#70bb65".obs;
  RxInt currentBookTotalHadis = 7563.obs;

  RxInt currentChapterID = 1.obs;
  RxString currentChapter = "ওহীর সূচনা অধ্যায়".obs;
  
  RxInt currentSectionID = 1.obs;
  RxString currentSectionNumber = "".obs;
  RxString currentSectionTitle = "".obs;
  RxString currentSectionPreface = "".obs;

  RxInt currentHadithID = 1.obs;


  void changeBook(
      int book, String abvr, String color, String name, int totalHadis) {
    currentBookID.value = book;
    currentBookAbvr.value = abvr;
    currentBookColor.value = color;
    currentBookName.value = name;
    currentBookTotalHadis.value = totalHadis;
  }

  void changChapter(String name, int id) {
    currentChapter.value = name;
    currentChapterID.value = id;
  }
}
