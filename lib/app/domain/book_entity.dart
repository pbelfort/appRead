class BookEntity {
  BookEntity({
    required this.uuidBook,
    required this.title,
    required this.level,
    required this.description,
  });

  final String uuidBook;
  final String? title;
  final int? level;
  final String? description;
}
