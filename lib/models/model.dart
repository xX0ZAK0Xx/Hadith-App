class Books {
  int id;
  String title, title_ar;
  int number_of_hadis;
  String abvr_code, book_name, book_descr, color_code;

  Books(this.id, this.title, this.title_ar, this.number_of_hadis,
      this.abvr_code, this.book_name, this.book_descr, this.color_code);
}

class Chapters {
  int id, chapter_id, book_id, number;
  String title, hadis_range, book_name;
  
  Chapters(this.id, this.chapter_id, this.book_id, this.book_name, this.title, this.hadis_range, this.number);
}
