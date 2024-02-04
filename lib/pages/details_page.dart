import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith/components/details_card.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/book_controller.dart';
import 'package:hadith/controller/navigation_controller.dart';
import 'package:hadith/models/model.dart';
import 'package:hadith/services/helper.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {
  DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  NavigationController navigationController = Get.put(NavigationController());
  BookController bookController = Get.put(BookController());
  DBHelper dbHelper = DBHelper();
  late Future<List<Hadiths>> hadithsFuture;
  List<Hadiths>? _hadiths_list;

  @override
  void initState() {
    // TODO: implement initState
    hadithsFuture = loadHadiths();
    super.initState();
  }

  Future<List<Hadiths>> loadHadiths() async {
    return dbHelper.getHadiths(
        bookController.currentBookID.value,
        bookController.currentChapterID.value,
        bookController.currentSectionID.value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
            style: appStylePoppins(Colors.white, FontWeight.w500, 12),
          ),
        ),
        //----------------- Body ------------------
        Expanded(
          //--------------- green background ----------------
          child: Container(
            width: double.infinity,
            color: appGreen(),
            //-------------- scrollable container ----------------
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: bgColor(),
              ),
              child: FutureBuilder<List<Hadiths>>(
                future: hadithsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator while waiting for data
                    return Center(
                        child: CircularProgressIndicator(
                      color: appGreen(),
                    ));
                  } else if (snapshot.hasError) {
                    // Show an error message if data loading fails
                    return Text('Error loading hadiths: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // Handle the case where there is no data
                    return Text('No books available.');
                  } else {
                    // Data loaded successfully, build the ListView.builder
                    _hadiths_list = snapshot.data;
                    int currentChapterID = bookController.currentChapterID.value;
                    int currentBookID = bookController.currentBookID.value;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return DetailsCard(
                          hadiths: _hadiths_list,
                          arabic: _hadiths_list?[index].ar,
                          bangla: _hadiths_list?[index].bn,
                          narrator: _hadiths_list?[index].narrator,
                          footNote: _hadiths_list?[index].note,
                          totalHadith: _hadiths_list!.length,
                            hexagonColor: bookController.currentBookColor.value,
                            grade: _hadiths_list?[index].grade,
                            gradeColor: _hadiths_list?[index].grade_color,
                            bookAbvr: bookController.currentBookAbvr.value,
                            bookName: bookController.currentBookName.value,
                            hadithId: _hadiths_list?[index].hadith_id,
                            sectionNumber: bookController.currentSectionNumber.value,
                            sectionPreface: bookController.currentSectionPreface.value,
                            sectionTitle: bookController.currentSectionTitle.value);
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
