import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith/components/chapter_card.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/book_controller.dart';
import 'package:hadith/controller/navigation_controller.dart';
import 'package:hadith/models/model.dart';
import 'package:hadith/services/helper.dart';

// ignore: must_be_immutable
class ChaptersPage extends StatefulWidget {
  ChaptersPage({super.key});

  @override
  State<ChaptersPage> createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  DBHelper dbHelper = DBHelper();
  late Future<List<Chapters>> chaptersFuture;
  List<Chapters>? _chapters_list;
  NavigationController navigationController = Get.put(NavigationController());
  BookController bookController = Get.put(BookController());

  @override
  void initState() {
    super.initState();
    chaptersFuture = loadChapters();
  }

  Future<List<Chapters>> loadChapters() async {
    return dbHelper.getChapters(bookController.currentBookID.value);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //------------- AppBar -------------------
        ListTile(
          leading: IconButton(
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              navigationController.changePage(0);
            },
          ),
          tileColor: appGreen(),
          title: Text(
            bookController.currentBookName.value,
            style: appStylePoppins(Colors.white, FontWeight.w600, 16),
          ),
          subtitle: Text(
            "${bookController.currentBookTotalHadis.value} টি হাদিস",
            style: appStylePoppins(Colors.white, FontWeight.w500, 14),
          ),
        ),
        Expanded(
          child: Container(
            color: appGreen(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: bgColor(),
              ),
              padding: const EdgeInsets.all(15),
              child: FutureBuilder<List<Chapters>>(
                future: chaptersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator while waiting for data
                    return Center(
                        child: CircularProgressIndicator(
                      color: appGreen(),
                    ));
                  } else if (snapshot.hasError) {
                    // Show an error message if data loading fails
                    return Text('Error loading books: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // Handle the case where there is no data
                    return Text('No books available.');
                  } else {
                    // Data loaded successfully, build the ListView.builder
                    _chapters_list = snapshot.data;
                    int currentBookID = bookController.currentBookID.value;
                    // Filter the _chapters_list to include only chapters with the matching book_id
                    List<Chapters>? selectedChapter;
                    selectedChapter = _chapters_list!
                        .where((chapter) => chapter.book_id == currentBookID)
                        .toList();

                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: selectedChapter.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              navigationController.changePage(2);
                              bookController.changChapter(
                                  selectedChapter![index].title,
                                  selectedChapter[index].chapter_id);
                            },
                            child: ChapterCard(
                              index: index + 1,
                              title: selectedChapter![index].title,
                              range: selectedChapter[index].hadis_range,
                            ));
                      },
                    );
                  }
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
