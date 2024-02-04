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

class Hadiths {
  int? id, book_id, chapter_id, section_id, hadith_id, grade_id;
  String? book_name,
      hadith_key,
      narrator,
      bn,
      ar,
      ar_diacless,
      note,
      grade,
      grade_color;

  Hadiths(
      this.id,
      this.book_id,
      this.chapter_id,
      this.section_id,
      this.hadith_id,
      this.grade_id,
      this.book_name,
      this.hadith_key,
      this.narrator,
      this.bn,
      this.ar,
      this.ar_diacless,
      this.note,
      this.grade,
      this.grade_color);
}
