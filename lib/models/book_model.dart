class BookModel {
  String imgUrl, year, language, publisher, title, author, bookId, pages;
  BookModel(
      {required this.author,
      required this.bookId,
      required this.imgUrl,
      required this.language,
      required this.pages,
      required this.publisher,
      required this.title,
      required this.year});
}
