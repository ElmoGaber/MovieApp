import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/localDataHelper/localDataHelper.dart';
import 'package:movie_app/core/model/moviemodel.dart';
import 'package:movie_app/features/Splach/presentation/uiScreens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());
  await Hive.openBox<MovieModel>('moviesBox');
  localDataHelper.init();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
