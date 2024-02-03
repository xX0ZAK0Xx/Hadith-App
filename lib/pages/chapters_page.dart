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

  @override
  void initState() {
    super.initState();
    chaptersFuture = loadChapters();
  }

  Future<List<Chapters>> loadChapters() async {
    return dbHelper.getChapters();
  }

  NavigationController navigationController = Get.put(NavigationController());
  BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "সব অধ্যায় সমূহ",
            style: appStyle(Colors.grey.shade700, FontWeight.bold, 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<Chapters>>(
              future: chaptersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while waiting for data
                  return Center(child: CircularProgressIndicator());
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
                  _chapters_list = _chapters_list!
                      .where((chapter) => chapter.book_id == currentBookID)
                      .toList();

                  // Print the filtered _chapters_list
                  // for (int i = 0; i < _chapters_list!.length; i++) {
                  //   print(_chapters_list![i].book_id);
                  // }

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _chapters_list!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            navigationController.changePage(2);
                          },
                          child: ChapterCard(
                            title: _chapters_list![index].title,
                            range: _chapters_list![index].hadis_range,
                          ));
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
