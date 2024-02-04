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

  Chapters(this.id, this.chapter_id, this.book_id, this.book_name, this.title,
      this.hadis_range, this.number);
}

class Sections {
  int? id, book_id, chapter_id, section_id, sort_order;
  String? book_name, title, preface, number;

  Sections(this.id, this.book_id, this.chapter_id, this.section_id,
      this.sort_order, this.book_name, this.title, this.preface, this.number);
}
