import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith/components/section_card.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/book_controller.dart';
import 'package:hadith/controller/navigation_controller.dart';
import 'package:hadith/models/model.dart';
import 'package:hadith/services/helper.dart';

// ignore: must_be_immutable
class SectionsPage extends StatefulWidget {
  SectionsPage({super.key});

  @override
  State<SectionsPage> createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage> {
  DBHelper dbHelper = DBHelper();
  late Future<List<Sections>> sectionsFuture;
  List<Sections>? _sections_list;

  @override
  void initState() {
    super.initState();
    sectionsFuture = loadSections();
  }

  Future<List<Sections>> loadSections() async {
    return dbHelper.getSections();
  }

  NavigationController navigationController = Get.put(NavigationController());
  BookController bookController = Get.put(BookController());

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
              navigationController.changePage(1);
            },
          ),
          tileColor: appGreen(),
          title: Text(
            bookController.currentBookName.value,
            style: appStylePoppins(Colors.white, FontWeight.w600, 16),
          ),
          subtitle: Text(
            bookController.currentChapter.value,
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
              child: FutureBuilder<List<Sections>>(
                future: sectionsFuture,
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
                    _sections_list = snapshot.data;
                    int currentChapterID = bookController.currentChapterID.value;
                    int currentBookID = bookController.currentBookID.value;


                    List<Sections>? selectedSection;
                    selectedSection = _sections_list!
                        .where((section) =>
                            ((section.chapter_id == currentChapterID) &&
                                (section.book_id == currentBookID)))
                        .toList();

                    // for (int i = 0; i < selectedSection.length; i++) {
                    //   print(selectedSection[i].title);
                    // }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: selectedSection.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              navigationController.changePage(3);
                            },
                            child: SectionCard(
                              index: index + 1,
                              title: selectedSection![index].title!,
                              number: selectedSection[index].number!,
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
