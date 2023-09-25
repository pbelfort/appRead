import 'package:app_read/app/domain/book_entity.dart';
import 'package:flutter/material.dart';
import '../../domain/quiz_entity_db.dart';
import '../../theme/app_colors.dart';

class CustomCardWidget extends StatelessWidget {
  final BookEntity book;
  final Function()? action;
  final bool enabled;

  const CustomCardWidget({
    Key? key,
    required this.action,
    required this.book,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? action : null,
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
                  enabled
                      ? Icons.radio_button_unchecked
                      : Icons.check_circle_outline_rounded,
                  color: enabled ? AppColors.primaryColor : AppColors.darkGray,
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
                              color: enabled
                                  ? AppColors.primaryColor
                                  : AppColors.darkGray,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Text(
                          (book.level!).toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: enabled
                                        ? AppColors.primaryColor
                                        : AppColors.darkGray,
                                    fontWeight: FontWeight.w500,
                                  ),
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

class CustomCardQuizWidget extends StatelessWidget {
  final IconData icon;
  final QuizEntityDB quiz;
  final Function()? action;

  const CustomCardQuizWidget({
    Key? key,
    required this.action,
    required this.quiz,
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
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        quiz.bookName,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Text(
                          (quiz.grade).toString(),
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
