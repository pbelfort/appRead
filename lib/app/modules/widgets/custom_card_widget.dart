import 'package:flutter/material.dart';

import '../../data/model/book_model.dart';
import '../../theme/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  final IconData icon;
  final BookModel book;
  final Function()? onTap;

  const CustomCardWidget({
    Key? key,
    this.onTap,
    required this.book,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Icon(
                (book.ageBook! / 10000).floor() < 40
                    ? Icons.radio_button_unchecked
                    : Icons.verified,
                color: AppColors.primaryColor,
                size: 20,
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
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Text(
                        book.description!.substring(0, 20),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      child: Text(
                        (book.ageBook! / 10000).floor().toString(),
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
