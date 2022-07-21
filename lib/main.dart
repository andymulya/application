import 'package:flutter/material.dart';

import 'views/pages/surah_list_page.dart';

void main() => runApp(const Application());

class Application extends StatelessWidget{
  const Application({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SurahListPage(),
    );
  } 
}