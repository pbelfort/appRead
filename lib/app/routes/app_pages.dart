import 'package:app_read/app/modules/library/library_binding.dart';
import 'package:app_read/app/modules/library/library_page.dart';
import 'package:app_read/app/modules/reading/reading_binding.dart';
import 'package:app_read/app/modules/reading/reading_page.dart';
import 'package:app_read/app/modules/user_book/user_book_page.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/initial/initial_binding.dart';
import '../modules/initial/initial_page.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';
import '../modules/register/1_form_register/register_binding.dart';
import '../modules/register/1_form_register/register_page.dart';
import '../modules/register/2_token/token_binding.dart';
import '../modules/register/2_token/token_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
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

    //INITIAL PAGE
    GetPage(
      name: Routes.INITIAL,
      page: () => const InitialPage(),
      binding: InitialBinding(),
    ),

    //REGISTER PAGE
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),

    //TOKEN PAGE
    GetPage(
      name: Routes.TOKEN,
      page: () => const TokenPage(),
      binding: TokenBinding(),
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
  ];
}
