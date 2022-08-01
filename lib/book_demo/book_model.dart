
import 'package:get/get.dart';

class Book {
  final int bookId;
  final String bookName;

  Book(this.bookId, this.bookName);
}

class BookModel {
  static var _books = [
    Book(1, "夜的命名数"),
    Book(2, "大奉打更人"),
    Book(3, "星门"),
    Book(4, "大魏读书人"),
    Book(5, "我师兄实在太稳健了"),
    Book(6, "深空彼岸"),
  ];

  int get length => _books.length;

  Book getById(int id) => _books[id - 1];

  Book getByPosition(int position) => _books[position];
}
