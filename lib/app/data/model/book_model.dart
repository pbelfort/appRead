import 'dart:convert';

// userRegisterModel userRegisterModelFromJson(str) => userRegisterModel.fromJson(str);

String userRegisterModelToJson(BookModel book) => json.encode(
      book.toJson(),
    );

class BookModel {
  BookModel({
    required this.title,
    required this.ageBook,
    required this.description,
  });

  final String? title;
  final int? ageBook;
  final String? description;

  BookModel copyWith({
    final String? title,
    final int? ageBook,
    final String? description,
  }) {
    return BookModel(
      title: title ?? this.title,
      ageBook: ageBook ?? this.ageBook,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'ageBook': ageBook,
        'description': description,
      };
}
