import 'package:app_read/app/domain/book_entity.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  final IconData icon;
  final BookEntity book;
  final Function()? action;

  const CustomCardWidget({
    Key? key,
    required this.action,
    required this.book,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: <Widget>[
                Icon(
                  (book.level! / 10000).floor() < 40
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Text(
                          (book.level!).toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
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
      ),
    );
  }
}
