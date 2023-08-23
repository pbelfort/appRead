class BookEntity {
  BookEntity({
    required this.id,
    required this.uuidBook,
    required this.title,
    required this.level,
    required this.description,
  });

  final int id;
  final String uuidBook;
  final String? title;
  final int? level;
  final String? description;
}
