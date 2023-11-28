void main() {
  // Хранение информации о книгах
  Map<int, Map<String, String>> books = {
    1: {'title': 'Дневник Анны Франк', 'author': 'Анна Франк'},
    2: {'title': 'Мастер и Маргарита', 'author': 'Михаил Булгаков'},
  };

  // Хранение информации о читателях
  List<Map<String, dynamic>> readers = [];

  // Отслеживание выданных книг
  Set<int> issuedBooks = {};

  // Функция добавления книги в библиотеку
  void addBook(int id, String title, String author) {
    books[id] = {'title': title, 'author': author};
  }

  // Функция удаления книги из библиотеки
  void removeBook(int id) {
    books.remove(id);
    issuedBooks.remove(id);
  }

  // Функция регистрации нового читателя
  void registerReader(String name) {
    readers.add({'name': name, 'registrationDate': DateTime.now(), 'borrowedBooks': <int>[]});
  }

  // Функция удаления информации о читателе
  void unregisterReader(String name) {
    readers.removeWhere((reader) => reader['name'] == name);
  }

  // Функция выдачи книги читателю
  void issueBook(int bookId, String readerName) {
    if (!issuedBooks.contains(bookId)) {
      Map<String, dynamic> reader = readers.firstWhere((reader) => reader['name'] == readerName);

      if (reader != null) {
        reader['borrowedBooks'].add(bookId);
        issuedBooks.add(bookId);
        print('${books[bookId]?['title']} выдана читателю $readerName');
      } else {
        print('Читатель $readerName не найден.');
      }
    } else {
      print('Книга уже выдана.');
    }
  }

  // Функция возврата книги в библиотеку
  void returnBook(int bookId, String readerName) {
    if (issuedBooks.contains(bookId)) {
      Map<String, dynamic> reader = readers.firstWhere((reader) => reader['name'] == readerName);

      if (reader != null) {
        reader['borrowedBooks'].remove(bookId);
        issuedBooks.remove(bookId);
        print('${books[bookId]?['title']} возвращена библиотеке от читателя $readerName');
      } else {
        print('Читатель $readerName не найден.');
      }
    } else {
      print('Книга не была выдана.');
    }
  }

  // Функция поиска книг по названию или автору
  List<Map<String, String>> searchBooks(String query) {
    return books.values
        .where((book) => book['title']!.contains(query) || book['author']!.contains(query))
        .toList();
  }

  // Функция фильтрации списка читателей по критериям
  List<Map<String, dynamic>> filterReaders(bool Function(Map<String, dynamic>) filter) {
    return readers.where(filter).toList();
  }

  // Пример использования
  addBook(3, '1984', 'Джордж Оруэлл');
  addBook(4, 'Преступление и наказание', 'Фёдор Достоевский');

  registerReader('Петр Петров');
  registerReader('Елена Иванова');

  issueBook(3, 'Петр Петров');
  issueBook(4, 'Елена Иванова');

  print('Поиск книг по запросу "Преступление": ${searchBooks("Преступление")}');

  var longTimeReaders = filterReaders((reader) => DateTime.now().difference(reader['registrationDate']).inDays >= 365);
  print('Читатели с библиотекой более года: $longTimeReaders');
}