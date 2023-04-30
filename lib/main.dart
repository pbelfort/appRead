import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/modules/splash/splash_binding.dart';
import 'app/modules/splash/splash_page.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
      child: ScreenUtilInit(
        designSize: const Size(360, 720),
        builder: (ctx, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.SPLASH, //Rota inicial
          initialBinding: SplashBinding(), // dependencias iniciais
          home: const SplashPage(), // Page inicial
          theme: appThemeData, //Tema personalizado app
          defaultTransition:
              Transition.leftToRight, // Transição de telas padrão
          getPages: AppPages.routes, // Seu array de navegação contendo as rotas
          locale: const Locale('pt', 'BR'), // Língua padrão
          // translationsKeys:
          //     AppTranslation.translations, // Suas chaves contendo as traduções<map>
        ),
      ),
    );
  }
}
