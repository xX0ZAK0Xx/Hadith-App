import 'package:flutter/material.dart';
import 'package:hadith/components/hadith_book_card.dart';
import 'package:hadith/const/styles.dart';
import 'package:hadith/services/db_helper.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("সব হাদিসের বই", style: appStyle(Colors.grey.shade700, FontWeight.bold, 20),),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return HadithBookCard();
                }),
          )
        ],
      ),
    );
  }
}

