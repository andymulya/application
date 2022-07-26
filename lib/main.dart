import 'package:application/providers/surah_detail_provider.dart';
import 'package:application/providers/surah_list_provider.dart';
import 'package:application/views/pages/surah_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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