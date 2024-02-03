import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith/components/hadith_book_card.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/controller/book_controller.dart';
import 'package:hadith/controller/navigation_controller.dart';
import 'package:hadith/models/model.dart';
import 'package:hadith/services/helper.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper dbHelper = DBHelper();
  late Future<List<Books>> booksFuture;
  List<Books>? _books_list;

  @override
  void initState() {
    super.initState();
    booksFuture = loadBooks();
  }

  Future<List<Books>> loadBooks() async {
    return dbHelper.getBooks();
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
            "সব হাদিসের বই",
            style: appStyle(Colors.grey.shade700, FontWeight.bold, 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<Books>>(
              future: booksFuture,
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
                  _books_list = snapshot.data;

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _books_list!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          bookController.changeBook(_books_list![index].id, _books_list![index].abvr_code, _books_list![index].color_code, _books_list![index].title);
                          navigationController.changePage(1);
                        },
                        child: HadithBookCard(
                          abvr_code: _books_list![index].abvr_code,
                          title: _books_list![index].title,
                          title_ar: _books_list![index].title_ar,
                          number_of_hadis:
                              _books_list![index].number_of_hadis.toString(),
                          hexagonColor: _books_list![index].color_code,
                        ),
                      );
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
