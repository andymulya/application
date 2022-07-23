import 'dart:io';

import 'package:application/providers/surah_list_provider.dart';
import 'package:application/services/http_overrides.dart';
import 'package:application/views/pages/surah_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/pages/surah_list_page.dart';

void main(){
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Application());
}

class Application extends StatelessWidget{
  const Application({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SurahListProvider()),
      ],
      child: MaterialApp(
        initialRoute: SurahListPage.routeName,
        routes: {
          SurahListPage.routeName : (context) => const SurahListPage(),
          SurahDetailPage.routeName : (context) => const SurahDetailPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  } 
}