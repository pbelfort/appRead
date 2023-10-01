import 'package:app_read/app/modules/library/library_binding.dart';
import 'package:app_read/app/modules/library/library_page.dart';
import 'package:app_read/app/modules/reading/reading_binding.dart';
import 'package:app_read/app/modules/reading/reading_page.dart';
import 'package:app_read/app/modules/splash/splash_binding.dart';
import 'package:app_read/app/modules/splash/splash_page.dart';
import 'package:app_read/app/modules/user_book/user_book_page.dart';
import '../modules/admin/admin_binding.dart';
import '../modules/admin/admin_page.dart';
import '../modules/admin/widgets/child_form_fill.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';
import '../modules/quiz/quiz_binding.dart';
import '../modules/quiz/quiz_page.dart';
import '../modules/user_book/user_book_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static final routes = [
    //SPLASH PAGE
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),

    // HOME PAGE
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),

    //LOGIN PAGE
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    //USER BOOK PAGE
    GetPage(
      name: Routes.USER_BOOK,
      page: () => const UserBookPage(),
      binding: UserBookBinding(),
    ),

    //LIBRARY PAGE
    GetPage(
      name: Routes.LIBRARY,
      page: () => const LibraryPage(),
      binding: LibraryBinding(),
    ),

    //READING PAGE
    GetPage(
      name: Routes.READING_BOOK,
      page: () => const ReadingPage(),
      binding: ReadingBinding(),
    ),

    //QUIZ PAGE
    GetPage(
      name: Routes.QUIZ,
      page: () => const QuizPage(),
      binding: QuizBinding(),
    ),

    //ADMIN PAGE
    GetPage(
      name: Routes.ADMIN,
      page: () => const AdminPage(),
      binding: AdminBinding(),
    ),

    //CHILD FILL PAGE
    GetPage(
      name: Routes.CHILD_FORM_FILL,
      page: () => const ChildFormFillPage(),
      binding: AdminBinding(),
    ),
  ];
}
