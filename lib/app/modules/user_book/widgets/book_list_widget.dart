import 'package:app_read/app/data/model/book_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../user_book_controller.dart';

class Trades extends GetView<UserBookController> {
  const Trades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              ...controller.mockList.map(
                (book) => TransactionCard(
                  book: book,
                  icon: Icons.abc,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final IconData icon;
  final BookModel book;
  final Function()? onTap;

  const TransactionCard({
    Key? key,
    this.onTap,
    required this.book,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 48,
                width: 48,
                child: Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.title ?? '',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        book.description!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
