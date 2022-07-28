import 'dart:io';

import 'package:application/providers/button_custom_provider.dart';
import 'package:application/providers/surah_detail_provider.dart';
import 'package:application/providers/surah_list_provider.dart';
import 'package:application/views/pages/splash_screen_page.dart';
import 'package:application/views/pages/surah_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/pages/surah_list_page.dart';

void main(){
  runApp(const Application());
}

class Application extends StatelessWidget{
  const Application({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SurahListProvider()),
        ChangeNotifierProvider(create: (context) => SurahDetailProvider()),
        ChangeNotifierProvider(create: (context) => ButtonCustomProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFeafffe),
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: const Color(0xFF00a3ad),
            titleTextStyle: GoogleFonts.bebasNeue(
              letterSpacing: 1.4,
              fontSize: 16,
            ),

          ),
        ),
        routes: {
          SplashScreen.routeName : (context) => const SplashScreen(),
          SurahListPage.routeName : (context) => const SurahListPage(),
          SurahDetailPage.routeName : (context) => const SurahDetailPage(),
        },
        debugShowCheckedModeBanner: false,
        home: LayoutBuilder(
          builder: (context, constraints) {
            return (Platform.isAndroid && Platform.isIOS) ? const SplashScreen() : const SurahListPage();
          },
        ),
      ),
    );
  } 
}