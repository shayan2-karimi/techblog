import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_66666/my_colors.dart';
import 'package:flutter_application_66666/view/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.statusBarColorCustom,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: MyColors.systemNavigationBarColorCustom,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var textThemeCustom = Theme.of(context).textTheme;
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persion
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return textThemeCustom.bodyLarge!.copyWith(fontSize: 23);
                }
                return textThemeCustom.bodyLarge;
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return MyColors.primeryColor;
                }
                return MyColors.primeryColor;
              },
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // مستطیل کامل
              ),
            ),
            minimumSize:
                WidgetStateProperty.all(const Size(140, 50)), // عرض و ارتفاع
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                  vertical: 20, horizontal: 40), // فضای داخلی
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          outlineBorder: const BorderSide(
            color: MyColors.outlineBorderColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 4,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: MyColors.posterSubTitle,
          ),
          displayLarge: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: MyColors.posterTitle,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: MyColors.seeMore,
          ),
          headlineMedium: TextStyle(
            //headline4
            fontFamily: 'Ubuntu',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 70, 70, 70),
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: MyColors.hintTextColor,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
